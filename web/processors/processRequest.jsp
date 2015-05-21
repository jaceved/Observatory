<%-- 
    Document   : processRequest
    Created on : Mar 28, 2015, 2:48:25 PM
    Author     : Ryan Sharp
--%>
<%@page import="observatory.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(null == session.getAttribute("email")){
  // User is not logged in.
        response.sendRedirect("../user/login.jsp");
    }
    %>
<html>
   <head>
      <meta charset="utf-8">
      <title>Login - Observatory Scheduler</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" type="text/css" href="css/style1.css">
       <link rel="stylesheet" type="text/css" href="css/style1.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style2.css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script><script>WebFont.load({
                google: {
                    families: ["Montserrat:400,700", "Varela Round:400", "Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic", "Varela:400"]
                }
            });</script>
   </head>
   <body>
      <header class="w-section nav-bar">
         <div class="w-container">
            <div class="w-row">
               <div class="w-col w-col-4 w-clearfix brand-column">
                  <img class="logo" src="../images/logo.png" width="60" alt="LOGO">
                  <div class="company">Observatory Scheduler</div>
               </div>
               <nav class="w-col w-col-8 nav-column"><a class="nav-link" href="#mobile">Home</a><a class="nav-link" href="#features">Logout</a></nav>
            </div>
         </div>
      </header>
       
      <div class="w-section w-hidden-small w-hidden-tiny section grey" id="features">
         <div class="w-container">
            <div class="w-form">
               <form class="form1" id="email-form" name="form" data-name="form" >
                   <label class="text-box">Thank You! <br />Your proposal is now being processed.</label>
                   <a href="../user/home.jsp"><input class="w-button but" value="Return Home" data-wait="Please wait..."></a>
                   <a href="../user/proposal.jsp"><input class="w-button but" value="New Proposal" data-wait="Please wait..."></a>
              
               </form>
               
            </div>
         </div>
      </div>
      <footer class="w-section footer section">
         <div class="w-container">
            <div class="w-row">
               <div class="w-col w-col-6">
                  <div class="footer-text">Prime Ascension</div>
               </div>
               <div class="w-col w-col-6 right-footer-col"><img src="../images/siue.png" width="125" alt="SIUE"></div>
            </div>
         </div>
      </footer>
      <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   </body>

    

               <%
DatabaseManager db = new DatabaseManager();

String hourAsc = request.getParameter("hourAsc");
String minAsc = request.getParameter("minAsc");
String secAsc = request.getParameter("secAsc");

double hAsc = Double.valueOf(hourAsc);
double mAsc = Double.valueOf(minAsc);
double sAsc = Double.valueOf(secAsc);

double decimal_deg_RA = ((hAsc*15) + (mAsc/4) + (sAsc/240))/15;

String degDec = request.getParameter("degDec");
String minDec = request.getParameter("minDec");
String secDec = request.getParameter("secDec");

Double dDec = Double.valueOf(degDec);
Double mDec = Double.valueOf(minDec);
Double sDec = Double.valueOf(secDec);



double decimal_deg_DEC = (dDec) + (mDec/60) + (sDec/3600);

String p1 = request.getParameter("p1");
String p2 = request.getParameter("p2");
String p3 = request.getParameter("p3");
String p4 = request.getParameter("p4");
String p5 = request.getParameter("p5");

String et1 = request.getParameter("et1");
String et2 = request.getParameter("et2");
String et3 = request.getParameter("et3");
String et4 = request.getParameter("et4");
String et5 = request.getParameter("et5");

String target = request.getParameter("target");
String angle = request.getParameter("angle");
String repeat = request.getParameter("repeat");
String frame = request.getParameter("frame");
String binning = request.getParameter("binning");
String count = request.getParameter("count");





db.InsertIntoParamsQuery(target, "userID", Double.toString(decimal_deg_RA) , Double.toString(decimal_deg_DEC) , angle, repeat, frame, p1, et1, binning, count);
db.InsertIntoParamsQuery( target, "userID",Double.toString(decimal_deg_RA) , Double.toString(decimal_deg_DEC), angle, repeat, frame, p2, et2, binning, count);
db.InsertIntoParamsQuery( target, "userID",Double.toString(decimal_deg_RA) , Double.toString(decimal_deg_DEC), angle, repeat, frame, p3, et3, binning, count);
db.InsertIntoParamsQuery( target, "userID",Double.toString(decimal_deg_RA) , Double.toString(decimal_deg_DEC) , angle, repeat, frame, p4, et4, binning, count);
db.InsertIntoParamsQuery(target, "userID", Double.toString(decimal_deg_RA) , Double.toString(decimal_deg_DEC) , angle, repeat, frame, p5, et5, binning, count);
        
  
        
        
        %>
    
    
</html>