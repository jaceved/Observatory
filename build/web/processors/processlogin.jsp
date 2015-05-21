

<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.DatabaseManager" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authenticating...</title>
    </head>
    <body>

        <p> Authenticating.. please wait.. </p>

        <%
            //Grabs what the user entered from the fields
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String storedPword = "";
            boolean schedulingPermission = false;
            boolean adminPermission = false;

            DatabaseManager dbManager = new DatabaseManager();
            ResultSet rs;
            rs = dbManager.selectSpecificTempUserQuery(email);

            if (rs.next() == true) {
                storedPword = rs.getString("password");
                schedulingPermission = rs.getBoolean("schedulingPermission");
                adminPermission = rs.getBoolean("adminPermission");
                rs.close();
                dbManager.closeCxn();
            } else {
                rs.close();
                dbManager.closeCxn();
            }

            DatabaseManager dbManager2 = new DatabaseManager();
            ResultSet rs2;
            rs2 = dbManager2.selectSpecificUserQuery(email);

            if (rs2.next() == true) {
                storedPword = rs2.getString("password");
                schedulingPermission = rs2.getBoolean("schedulingPermission");
                adminPermission = rs2.getBoolean("adminPermission");
                rs2.close();
                dbManager2.closeCxn();
            } else {
                rs2.close();
                dbManager2.closeCxn();

                 session.setAttribute("alertuser", "alertuser");
                response.sendRedirect("../user/login.jsp");
            }

            // Hash a password for the first time
            BCrypt bCrypt = new BCrypt();
            if(storedPword.equals("") == false) {
            if (bCrypt.checkpw(password, storedPword) == true) {
                
                session.setAttribute("email", email);
                
                if (schedulingPermission == true) {
                    session.setAttribute("schedulingPermission", "yes");
                }

                if (adminPermission == true) {
                    session.setAttribute("adminPermission", "yes");
                }
                
                out.print("they match");
                response.sendRedirect("../user/home.jsp");
            }
            }
             
           
              //  HttpServletResponse response = (HttpServletResponse) getResponse();

                if (!response.isCommitted()){
                session.setAttribute("alertuser", "alertuser");
                response.sendRedirect("../user/login.jsp");
            
                }
        %>

    </body>
</html>



