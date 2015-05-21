package observatory;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jaime
 */
public class FileManager {

     File currentDir;
     Date date;
     Calendar cal;
     String year;
     String month;
     String day;
     String folder;
     String localHostFolder;
     String filePath;
     String localhostPath;
     
  public   FileManager(){ 
        currentDir=new File("");
        date = new Date();
        cal = Calendar.getInstance();
        cal.setTime(date);
        year = String.valueOf(cal.get(Calendar.YEAR));
        month = String.valueOf(cal.get(Calendar.MONTH));
        day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
        String absolutePath = currentDir.getAbsolutePath();
        folder = "ObservatoryXMLFiles";
        localHostFolder = "C:/Users/Matt/Documents/Observatory/web/ObservatoryXMLFiles";
        filePath = absolutePath.substring(0,absolutePath.lastIndexOf(File.separator))+"/"+folder;
        localhostPath = folder + "/"+ year + "/" + month + "/" + day;

     }

    
    public String getTodaysPath(){        
        String dayDirectory = localHostFolder+"/"+ year + "/" + month + "/" + day;
        return dayDirectory;
    }
    
    public void makeDir() {
        
        //Set todays directory paths
        File yearDirectory = new File(localHostFolder+"/"+ year);
        File monthDirectory = new File( localHostFolder+"/" + year + "/" + month);
        File dayDirectory = new File( localHostFolder+"/" + year + "/" + month + "/" + day);

    // if the directory  year does not exist, create it along with the month and
    // date.
        if (!yearDirectory.exists()) {
            boolean result = false;
            try {
                yearDirectory.mkdir();
                monthDirectory.mkdir();
                dayDirectory.mkdir();
                result = true;
            } catch (SecurityException se) {
                //handle it
            }
            if (result) {
                System.out.println("NEW YEAR.MONTH.DAY DIR created");
            }
        } // if the directory  month does not exist, create it along with the date.
        else if (!monthDirectory.exists()) {
            boolean result = false;
            try {
                monthDirectory.mkdir();
                dayDirectory.mkdir();
            } catch (SecurityException se) {
                //handle it
            }
            if (result) {
                System.out.println("MONTH.DAY DIR created");
            }

        } // if the directory for today does not exist, create it.
        else if (!dayDirectory.exists()) {
            boolean result = false;
            try {
                dayDirectory.mkdir();
            } catch (SecurityException se) {
                //handle it
            }
            if (result) {
                System.out.println("Today's DIR created");
            }

        }
    }
    
    
    public String getTimeStamp()
    {
  
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH.mm.ss");
    String formattedDate = sdf.format(date);
    
    return formattedDate;
    }
    
}
