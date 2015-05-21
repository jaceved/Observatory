


<%@page import="java.io.File"%>
<%@page import = "org.apache.commons.io.*"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="observatory.*" %> 


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Observations</title>
    </head>
    <body>



        <%

            // Directory path here is Xampp/CapturedObservations. This is what was used to test
            String path = "./CapturedObservations";

            String pictures;

            File Dir = new File(path);

// if the directory does not exist, create it
            if (!Dir.exists()) {

                try {
                    Dir.mkdir();

                } catch (SecurityException se) {
                    //handle it
                }

            }

            File[] listOfFiles = Dir.listFiles();

        %>
        <p>
            Picture files found:
        </p>
        <%            for (int i = 0; i < listOfFiles.length; i++) {
                if (listOfFiles[i].isFile()) {
                    pictures = listOfFiles[i].getName();
        %>
        <p> <%out.write(listOfFiles[i].getName());%> </p> 

        <%
                }
            }

            CapturedObservations capturedObs = new CapturedObservations();
            String eID[] = new String[listOfFiles.length];
            String requestID[] = new String[listOfFiles.length];
            String fileExt[] = new String[listOfFiles.length];

            String buffer[];
            for (int i = 0; i < listOfFiles.length; i++) {
                //calls the method that parses the picture names and seperates into eID and requestID
                //eID and requestID will be used to identify to whom the picture belongs
                buffer = capturedObs.distributePhotos(listOfFiles[i].getName());

                eID[i] = buffer[0];
                requestID[i] = buffer[1];
                fileExt[i] = buffer[2];

            }

            //At this point it is time to copy all files into the permanent folder and delete from this temp folder
            FileManager fm = new FileManager();
            String timeStamp = fm.getTimeStamp();
            String finalPath = "./PermanentObservations/" + timeStamp;
            File destFolder = new File(finalPath);
            //make the timestamp as a new directory in 'PermanentObservations'
            destFolder.mkdir();
            
          
            //for each file, me need to move the file to the PermanentObservations folder under the specified time stamp
            for(int i = 0; i < listOfFiles.length; i++) 
            {
            String startPath = "./CapturedObservations/" + listOfFiles[i].getName();
            File startFolder = new File(startPath);
            
            
          FileUtils.moveFileToDirectory(startFolder, destFolder, false);
            
            }
            
            
            
            for(int i = 0; i < listOfFiles.length; i++)
            {
            DatabaseManager db = new DatabaseManager();        
            String picLink = finalPath + "/" + eID[i] + "_" + requestID[i] + "." + fileExt[i];
            db.InsertIntoObservationsQuery(eID[i], eID[i] + "@siue.edu", fileExt[i], requestID[i], picLink);
           
            CapturedObservations notify = new CapturedObservations();
            String emailName = eID[i] + "@siue.edu";
            String emailFrom = "observatory@gmail.com";
            String subject = "New Observation Image";
            
            notify.sendNotification("localhost", emailName, emailFrom, subject, picLink);
            }
            
            out.write("Pictures added to the appropriate user's dropbox...");
            response.setHeader("Refresh", "3;../admin/addPictures.jsp");
        %>



    </body>
</html>
