package observatory;

/*
 *The purpose of this class is to create an XML file based on the current time. 
 The algoroithm is to convert sideral time to current time. 
 */
/**
 *
 * @author Jaime
 */
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.year;
import java.io.IOException;
import java.net.InetAddress;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.TimeZone;
import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

public class Scheduler implements Comparator<Proposal> {

    private static String curDate;
    private static Timestamp tstamp;
    private static Date min;
    private static Date max;
    private static ResultSet rs;

    //The below variables are set to dummy variables and will change.
    private static final int sunsetHour = 18;
    private static final int sunriseHour = 5;
    private static final double ObservatoryLongitude = 89.999167;
    private static final double ObservatoryLattitude = 38.786111;

    @Override
    public int compare(Proposal one, Proposal another) {
        int returnVal = 0;

        if (Double.parseDouble(one.getRA()) < Double.parseDouble(another.getRA())) {
            returnVal = -1;
        } else if (Double.parseDouble(one.getRA()) > Double.parseDouble(another.getRA())) {
            returnVal = 1;
        } else if (Double.parseDouble(one.getRA()) == Double.parseDouble(another.getRA())) {
            returnVal = 0;
        }
        return returnVal;

    }

    private static final SimpleDateFormat monthDayYearformatter = new SimpleDateFormat(
            "MM/dd/yyyy");
    private static Calendar cal;

    Scheduler() {

        cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        curDate = this.timestampToMonthDayYear(tstamp);
        setDateRanges();

    }

    // The below function is reading into the observatory database and collecting 
    // tonight's observatory proposals that go into the AM hours. A range of these hours
    // is declared by 
    public ArrayList getTodaysProposals() throws SQLException {

        ArrayList<Proposal> temp = new ArrayList<Proposal>();
        Proposal newP;

        DatabaseManager dbCxn = new DatabaseManager();
        tstamp = new Timestamp(cal.getTimeInMillis());
        curDate = timestampToMonthDayYear(tstamp);

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
        Date date = new Date();
        String today = sdf.format(date);

        String query = "SELECT * FROM params "
                + "WHERE STARTDATE = '" + today + "'";
        ////System.out.print(query);
        rs = dbCxn.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();

        int columnsNumber = rsmd.getColumnCount();
        while (rs.next()) {
            //////System.out.println();
            newP = new Proposal();

            for (int i = 1; i <= columnsNumber; i++) {
                //  if (i > 1) ////System.out.print(rs.getString(i)+" ,");

                String columnName = rsmd.getColumnName(i);
                // Get the name of the column's table name
                if ("STARTDATE".equals(columnName)) {
                    newP.setSTART_DATE(rs.getString(i));
                } else if ("STARTTIME".equals(columnName)) {
                    newP.setSTART_TIME(rs.getString(i));
                } else if ("TARGET".equals(columnName)) {
                    newP.setTARGET(rs.getString(i));
                } else if ("ID".equals(columnName)) {
                    newP.setID(rs.getString(i));
                } else if ("RA".equals(columnName)) {
                    newP.setRA(rs.getString(i));
                } else if ("DC".equals(columnName)) {
                    newP.setDC(rs.getString(i));
                } else if ("ANGLE".equals(columnName)) {
                    newP.setANGLE(rs.getString(i));
                } else if ("REPEAT".equals(columnName)) {
                    newP.setREPEAT(rs.getString(i));
                } else if ("FRAME".equals(columnName)) {
                    newP.setFRAME(rs.getString(i));
                } else if ("FILTER".equals(columnName)) {
                    newP.setFILTER(rs.getString(i));
                } else if ("EXPOSURE".equals(columnName)) {
                    newP.setEXPOSURE(rs.getString(i));
                } else if ("BINNING".equals(columnName)) {
                    newP.setBINNING(rs.getString(i));
                } else if ("COUNT".equals(columnName)) {
                    newP.setCOUNT(rs.getString(i));
                } else if ("requestID".equals(columnName)) {
                    newP.setREQUESTID(rs.getInt(i));
                    ////System.out.println(rs.getInt(i));
                }

            }

            temp.add(newP);
            ////System.out.println("");
        }

        ////System.out.println("Unsorted List:");
        for (Proposal temp1 : temp) {
            ////System.out.println(temp1.getRA());
        }

        //dbCxn.closeCxn();
        return temp;
    }

    ArrayList<Proposal> sortProposals(ArrayList<Proposal> unsorted) {

        //TO DO: REMOVE PROPSOALS OUTSIDE OF TWIGHLIGHT ZONE. 
        ArrayList<Proposal> sorted = new ArrayList<Proposal>();
        double CurrentLStime = this.getCurrentST(ObservatoryLongitude * -1) / 15;
        //double CurrentLStime = 22.112; //TEST VARIABLE
        int indexOfNearestObject = 0;
        int currentIndex = 0;
        double NearestMargin = 0.0;
        boolean marginSet = false;

        Collections.sort(unsorted, new Scheduler());

        Iterator<Proposal> it = unsorted.iterator();
        while (it.hasNext()) {
            Proposal obj = it.next();
            if (!marginSet) {
                NearestMargin = Math.abs(CurrentLStime - Double.parseDouble(obj.getRA()));
                indexOfNearestObject = currentIndex;
                ////System.out.println(NearestMargin);
                marginSet = true;
            } else {
                double tempMargin = Math.abs(CurrentLStime - Double.parseDouble(obj.getRA()));
                if (tempMargin < NearestMargin || Double.parseDouble(obj.getRA()) < NearestMargin) {
                    if (tempMargin < NearestMargin) {
                        NearestMargin = tempMargin;
                    } else {
                        NearestMargin = Double.parseDouble(obj.getRA());
                    }
                    indexOfNearestObject = currentIndex;
                    ////System.out.println(NearestMargin);

                }
            }
            currentIndex++;
        }

        ///TODO: ACCOMODATE FOR DIFFERENT CASES IN WHICH WE NEED TO SORT THE LIST.
        //
        // 1) IF THE CLOSEST OBJECT IS IN THE FIRST INDEX
        //      - Do not change the order of the ArrayList
        // 2) IF THE CLOSEST OBJECT IS IN THE LAST INDEX
        //      -  Move Last proposal time to begining and shift all other times to end
        // 3) IF THE CLOSEST OBJECT IS IN BETWEEN
        //      - Next 2 statements take care of the case. append tail to head
        if (indexOfNearestObject > 0) {
            ArrayList<Proposal> tail = new ArrayList(unsorted.subList(0, indexOfNearestObject));
            ArrayList<Proposal> head = new ArrayList(unsorted.subList(indexOfNearestObject, unsorted.size()));
            sorted.addAll(head);
            sorted.addAll(tail);
        } else {
            sorted = unsorted;
        }

        ////System.out.println("Sorted List:");
        for (Proposal temp1 : sorted) {
            ////System.out.println(temp1.getRA());
        }

        ////System.out.println("Current LST: " + CurrentLStime);
        ////System.out.println("Index of Sort: " + indexOfNearestObject);
        return unsorted;
    }

    void setDateRanges() {

        //Set-up today's and tomorrows range 
        Calendar tomorrowDate = cal;
        tomorrowDate.add(Calendar.DATE, 1);
        tomorrowDate.set(Calendar.HOUR, sunriseHour);

        Calendar todaysDate = cal;
        todaysDate.set(Calendar.HOUR, sunsetHour);

        min = todaysDate.getTime();
        max = tomorrowDate.getTime();

    }

    //Get the current Month Day Year
    public String timestampToMonthDayYear(Timestamp timestamp) {
        if (timestamp == null) {
            return null;
        } else {
            return monthDayYearformatter.format((java.util.Date) timestamp);
        }
    }

    // The below function takes the floor of a double and subtracts it from itself
    // to return a remainder. 
    double frac(double X) {
        X = X - Math.floor(X);
        if (X < 0) {
            X = X + 1.0;
        }
        return X;
    }

    public void updateProposals(ArrayList<Proposal> list) throws SQLException {

        DatabaseManager dbCxn = new DatabaseManager();

        for (Proposal newProposal : list) {
            String Query = "UPDATE params "
                    + "SET STARTDATE = '" + newProposal.getSTART_DATE() + "' , "
                    + "STARTTIME = '" + newProposal.getSTART_TIME() + "' , "
                    + "TARGET = '" + newProposal.getTARGET() + "' , "
                    + "ID = '" + newProposal.getID() + "' , "
                    + "RA = '" + newProposal.getRA() + "' , "
                    + "DC = '" + newProposal.getDC() + "' , "
                    + "ANGLE = '" + newProposal.getANGLE() + "' , "
                    + "`REPEAT` = '" + newProposal.getREPEAT() + "' , "
                    + "FILTER = '" + newProposal.getFILTER() + "' , "
                    + "EXPOSURE = '" + newProposal.getEXPOSURE() + "' , "
                    + "BINNING = '" + newProposal.getBINNING() + "' , "
                    + "`COUNT` = '" + newProposal.getCOUNT() + "' "
                    + "WHERE requestID = " + newProposal.getRequestID() + " ";
            ////System.out.println(Query);
            dbCxn.executeUpdate(Query);

        }

    }

    public ArrayList<Proposal> setDateandTime(ArrayList<Proposal> list, int offsetHour, int offsetmin) throws SQLException {
        DecimalFormat mFormat = new DecimalFormat("00");
        Date date = getNTPTime();
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("CST"));
        cal.setTime(date);
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
        String dayFormat = sdf.format(cal.getTime());

        if (offsetHour == 0 && offsetmin == 0) {
            offsetmin = 5;
        }

        int current_hour = cal.get(Calendar.HOUR_OF_DAY);

        int totalOffsetHour = current_hour + offsetHour;
        if (totalOffsetHour > 24) {
            current_hour = totalOffsetHour - 24;
            cal.add(Calendar.DATE, 1);
            dayFormat = sdf.format(cal.getTime());
        } else {
            current_hour += offsetHour;
        }
        int current_min = cal.get(Calendar.MINUTE);
        int totalOffsetmin = current_hour + offsetHour;
        if (totalOffsetmin > 60) {
            current_min = totalOffsetmin - 60;
        } else {
            current_min += offsetmin;
        }
        ////System.out.println("STARTING HOUR:" + current_hour + ":" + current_min);
        System.out.println(list.size());

        //25:49
        for (int i = 0; i < list.size(); i++) {
            //if (current_hour > sunsetHour && current_hour < sunriseHour) {
            if (current_hour <= 24) {
                // ////System.out.print("working");
                if (current_min > 59) {
                    int tempCurMin = current_min - 60;
                    current_min = tempCurMin;

                    if (current_hour == 24) {
                        current_hour = 0;
                    } else {
                        current_hour++;
                    }
                }
                  if (current_hour == 24) {
                        current_hour = 0;
                       cal.add(Calendar.DATE, 1);
                    dayFormat = sdf.format(cal.getTime());
                    }
                list.get(i).setSTART_TIME(mFormat.format(Double.valueOf(current_hour)) + ":" + mFormat.format(Double.valueOf(current_min)));
                list.get(i).setSTART_DATE(dayFormat);
                System.out.println(current_hour + ":" + current_min);
                // list.get(i).isScheduled = true;

            } else {
                current_hour = 0;

                if (current_min > 59) {
                    int tempCurMin = current_min - 60;
                    current_min = tempCurMin;
                }
                cal.add(Calendar.DATE, 1);
                dayFormat = sdf.format(cal.getTime());

                list.get(i).setSTART_TIME(mFormat.format(Double.valueOf(current_hour)) + ":" + mFormat.format(Double.valueOf(current_min)));
                list.get(i).setSTART_DATE(dayFormat);

            }

            current_min += 5;
        }
        // }

        updateProposals(list);

        return list;

    }

    //TODO: Convert Right Acension Angle time to Degrees. The function will return 
    //     the a double. 
    double RAtoDegrees(int hours, int minutes, int seconds) {

        double temp = 0;
        return temp;
    }

    // The below function is taking in an double variable 
    //  and converting that time to current sideral time.
    public void formatSiderealTime(double time) {
        time = time / 15;
        double h = Math.floor(time);
        double min = Math.floor(60.0 * frac(time));
        double secs = Math.round(60.0 * (60.0 * frac(time) - min));

        String str;
        if (min >= 10) {
            str = (int) h + ":" + (int) min;
        } else {
            str = (int) h + ":0" + (int) min;
        }
        //if (min==60) str=(h+1)+":00";
        if (secs < 10) {
            str = str + ":0" + (int) secs;
        } else {
            str = str + ":" + (int) secs;
        }
        ////System.out.println(" " + str);

    }

    public double getCurrentST(double lon) {
        Date date = getNTPTime();
        cal.setTime(date);
        int year = cal.get(Calendar.YEAR);
        int hour = cal.get(Calendar.HOUR_OF_DAY);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int min = cal.get(Calendar.MINUTE);
        int sec = cal.get(Calendar.SECOND);

        if (month == 1 || month == 2) {
            year = year - 1;
            month = month + 12;
        }

        double a = Math.floor(year / 100);
        double b = 2 - a + Math.floor(a / 4);

        double c = Math.floor(365.25 * year);
        double d = Math.floor(30.6001 * (month + 1));

        // days since J2000.0   
        double jd = b + c + d - 730550.5 + day + (hour + min / 60.0 + sec / 3600.0) / 24.0;

        double jt = jd / 36525.0;                   // julian centuries since J2000.0         
        double GMST = 280.46061837 + 360.98564736629 * jd + 0.000387933 * jt * jt - jt * jt * jt / 38710000 + lon;
        if (GMST > 0.0) {
            while (GMST > 360.0) {
                GMST -= 360.0;
            }
        } else {
            while (GMST < 0.0) {
                GMST += 360.0;
            }
        }

        return GMST;

    }

    //The below function is executing a Network Time Protocol to get the current time 
    // of a GMT NTP server. This is used to help determine Greenwhich Current time in
    // order to schedule reservation times. 
    public static Date getNTPTime() {

        String[] hosts = new String[]{
            "1.uk.pool.ntp.org"};

        NTPUDPClient client = new NTPUDPClient();
        // We want to timeout if a response takes longer than 5 seconds
        client.setDefaultTimeout(5000);
        Date dateR = new Date();
        for (String host : hosts) {

            try {
                InetAddress hostAddr = InetAddress.getByName(host);
                // ////System.out.println("> " + hostAddr.getHostName() + "/" + hostAddr.getHostAddress());
                TimeInfo info = client.getTime(hostAddr);
                Date date = new Date(info.getMessage().getTransmitTimeStamp().getTime());
                //////System.out.println(date.toString());
                dateR = date;

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        client.close();
        return dateR;
    }

    public static void main(String[] args) throws SQLException {

        ArrayList<Proposal> unscheduledObservationList = new ArrayList();
        ArrayList<Proposal> scheduledObservationList = new ArrayList();
        Scheduler ss = new Scheduler();
        ArrayList<Proposal> temp = ss.getTodaysProposals();

        unscheduledObservationList = ss.sortProposals(temp);

        scheduledObservationList = ss.setDateandTime(unscheduledObservationList, 1, 2);

    }

}
