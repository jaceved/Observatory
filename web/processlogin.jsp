<%-- 
    Document   : processlogin
    Created on : Feb 1, 2015, 2:51:01 PM
    Author     : Matthew Bunch
--%>

<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.DatabaseManager" %>
<%
    //Grabs what the user entered from the fields
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String eid = null;
    ///////////////////////////////////////////////////////////////////////////////////
    //HASH AND SALT PASSWORD HERE!!!
    //UPDATE password STRING
    ///////////////////////////////////////////////////////////////////////////////////
   String selectSQL = "SELECT * FROM users WHERE email = ? AND password = ?";
   try {
    DatabaseManager dbManager = new DatabaseManager();
    PreparedStatement preparedStatement = dbManager.establishCxn().prepareStatement(selectSQL);
    preparedStatement.setString(1, email);
    preparedStatement.setString(2, password);
    
    ResultSet rs = preparedStatement.executeQuery();
    
    //Something went wrong
    if(preparedStatement == null) {
      out.println("Connection to the database was not successfull");
      dbManager.closeCxn();
   }
    
    if(rs.next() == false) {
       out.println("Those credentials are not valid");     
       dbManager.setValidity(false);
       dbManager.closeCxn();
       response.sendRedirect("login.html");
    }
    
    while (rs.next()) {
        eid = rs.getString("eID");		
    }
    
   // dbManager.setValidity(true);
    dbManager.closeCxn();
    //create a session for the user
    session.setAttribute("email", email);
    session.setAttribute("eid", eid);
    response.sendRedirect("home.jsp");
    
     } catch (SQLException e) {
        out.println(e.getMessage());
 }
 
   
   
  
   %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authenticating...</title>
    </head>
    <body>

        <p> Authenticating.. please wait.. </p>

    </body>
</html>



