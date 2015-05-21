/*
 * The purpose of this class is to distribute the observation photos user's capture from telescope observations
 * Pictures will be sorted (assuming they are all in the same directory) and the picture location is sent
 * to the appropriate user in the observations table.
 */
package observatory;

import java.io.File;
import java.io.UnsupportedEncodingException;
import org.apache.commons.io.*;
import org.apache.commons.mail.*;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author mattB
 */
public class CapturedObservations {

    public String[] distributePhotos(String pictureName) {

        String[] parseArray1 = new String[2];
        String[] parseArray2 = new String[2];

        int index1 = 0;
        int index2 = 0;
        //The format for picture names is 'eID_requestID.fileextension'

        //This first split call should split the pictureName and 
        //give parseArray1[0] == eID
        //and pasrseArray[1] == requestID.fileextension
        for (String retval : pictureName.split("_", 2)) {
            parseArray1[index1] = retval;
            index1++;
        }

        //reqID will hold the requestID string
        //dotIndex is the index (in the string) of the period that seperates the requestID and fileextension
        String reqID;
        String fileExt;
        int dotIndex = 0;
        for (int i = 0; i < parseArray1[1].length(); i++) {
            if (parseArray1[1].charAt(i) == '.') {
                dotIndex = i;
                break;
            }
        }

        //store the requestID into reqID
        reqID = parseArray1[1].substring(0, dotIndex);

        //store the file extension into fileExt
        fileExt = parseArray1[1].substring(dotIndex + 1);

        String[] infoNeeded = new String[3];

        //give this array the eID as element 0 and requestID as element 1
        infoNeeded[0] = parseArray1[0];
        infoNeeded[1] = reqID;
        infoNeeded[2] = fileExt;

        return infoNeeded;
    }

    public void sendNotification(String hostname, String to, String from, String subject, String picLink) throws EmailException, UnsupportedEncodingException {
     
      // Recipient's email ID needs to be mentioned.
      String mailto = to;

      // Sender's email ID needs to be mentioned
      String mailfrom = from;

      // Assuming you are sending email from localhost
      String host = "localhost";

      // Get system properties
      Properties properties = System.getProperties();

      // Setup mail server
      properties.setProperty("mail.smtp.host", host);

      // Get the default Session object.
      Session session = Session.getDefaultInstance(properties);

      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(mailfrom));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(mailto));

         // Set Subject: header field
         message.setSubject(subject);

         // Now set the actual message
         message.setText("Here is the link to your observation pictures: \n" + picLink);

         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException messageEx) {
         messageEx.printStackTrace();
      }
   }
        
    }


