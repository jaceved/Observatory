
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.DatabaseManager" %>
<%@page import = "java.util.Date" %>

<%
String email = request.getParameter("email");
String eid = request.getParameter("eID");
String univID = request.getParameter("univID");
String section = request.getParameter("sectionID");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String password = request.getParameter("password");
String passwordConfirm = request.getParameter("pwordconfirm");
int priority = 10;
////////////////////////////////////////////////
//Getting today's date and formatting for storage in database
Calendar calender = Calendar.getInstance();

SimpleDateFormat sdDate = new SimpleDateFormat ("yyyy-MM-dd");

String dateCreated = sdDate.format(calender.getTime());

////////////////////////////////////////////////
boolean schedulingPermission = false;
boolean adminPermission = false;


if(password.equals(passwordConfirm) == false)
    {
    session.setAttribute("nomatch", "nomatch");
    response.sendRedirect("../user/register.jsp");
    }

    DatabaseManager db = new DatabaseManager();
    ResultSet rs = db.selectSpecificTempUserQuery(email);
     rs.beforeFirst();
    
     
    ResultSet rs2 = db.selectSpecificUserQuery(email);
    rs2.beforeFirst();
    
    if((rs.next() != false) || (rs2.next() != false))
    {
    session.setAttribute("userfound", "userfound");
    response.sendRedirect("../user/register.jsp");
    }

// Hash a password for the first time
    BCrypt BCrypt = new BCrypt();

// gensalt's log_rounds parameter determines the complexity
// the work factor is 2**log_rounds, and the default is 10
    String salt = BCrypt.gensalt(12);
    String hashed = BCrypt.hashpw(password, salt);

    
    db.InsertIntoTempUsersQuery(email, fname, lname, hashed, salt, eid, univID, section, priority, dateCreated, schedulingPermission, adminPermission);

    out.print("Your account has been created");
    response.setHeader("Refresh", "2;url=../user/login.jsp");
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Account...</title>
    </head>
    <body>
       
    </body>
</html>
