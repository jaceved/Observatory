

<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.DatabaseManager" %>
<%@ page import = "org.mindrot.jbcrypt.BCrypt" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    if (null == session.getAttribute("email")) {
        // User is not logged in.
        response.sendRedirect("../user/login.jsp");
    }

    if (!response.isCommitted()) {
        if (session.getAttribute("adminPermission") != "yes") {
            //user does not have permission, so throw them back to their home
            response.sendRedirect("../user/home.jsp");
        }
    }

    if (request.getParameter("insertuser") != null) {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        ////////////////////////////////////////////
        String tempPassword = request.getParameter("tempPassword");

        // Hash a password for the first time
        BCrypt BCrypt = new BCrypt();

        // gensalt's log_rounds parameter determines the complexity
        // the work factor is 2**log_rounds, and the default is 10
        String salt = BCrypt.gensalt(12);
        String hashed = BCrypt.hashpw(tempPassword, salt);
        /////////////////////////////////////////////////////
        String eID = request.getParameter("eID");
        String universityID = request.getParameter("universityID");
        String priority = request.getParameter("priority");
        
        
        String section = request.getParameter("section");

        //Getting today's date and formatting for storage in database
        Calendar calender = Calendar.getInstance();

        SimpleDateFormat sdDate = new SimpleDateFormat("yyyy-MM-dd");

        String dateCreated = sdDate.format(calender.getTime());

        boolean schedulingPermission = true;
        boolean adminPermission = false;

        DatabaseManager dbManager = new DatabaseManager();
        dbManager.InsertIntoUsersQuery(email, firstName, lastName, hashed, salt, eID, universityID, section, Integer.parseInt(priority), dateCreated, schedulingPermission, adminPermission);

        //hidden radio button sent over means this form was submitted and not the others
    } else if (request.getParameter("insertTempUser") != null) {

        String addUsers[] = request.getParameterValues("addUser");

        DatabaseManager dbManager = new DatabaseManager();

        for (String addUser : addUsers) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificTempUserQuery(addUser);
            rs.beforeFirst();
            while (rs.next() != false) {
                //Insert that user into users table
                dbManager.InsertIntoUsersQuery(rs.getString("email"), rs.getString("firstName"), rs.getString("lastName"),
                        rs.getString("password"), rs.getString("salt"), rs.getString("eID"),rs.getString("universityID"), rs.getString("section"), 
                        rs.getInt("priority"), rs.getString("dateCreated"), true, false);
                //Remove that user from the tempusers table
                dbManager.deleteSpecificTempUserQuery(rs.getString("email"));
            }
        }

        dbManager.closeCxn();

    } else if (request.getParameter("deleteTempUser") != null) {

        String dropTempUsers[] = request.getParameterValues("dropTempUsers");
        DatabaseManager dbManager = new DatabaseManager();

        for (String dropTempUser : dropTempUsers) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificTempUserQuery(dropTempUser);
            rs.beforeFirst();
            while (rs.next() != false) {
                dbManager.deleteSpecificTempUserQuery(rs.getString("email"));
            }
        }
        dbManager.closeCxn();

    } else if (request.getParameter("deleteUser") != null) {

        String dropUsers[] = request.getParameterValues("dropUsers");
        DatabaseManager dbManager = new DatabaseManager();

        for (String dropUser : dropUsers) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificUserQuery(dropUser);
            rs.beforeFirst();
            while (rs.next() != false) {
                //checking to see if the admin dropping users has selected himself
                //an admin may not commit suicide and drop himself
                if(rs.getString("email").equals(session.getAttribute("email")) == false) {
                dbManager.deleteSpecificUserQuery(rs.getString("email"));
                }
            }
        }
        dbManager.closeCxn();
    } else if (request.getParameter("editUser") != null) {

        String changeSchedPermission[] = request.getParameterValues("changeSchedulingPermission");
        String changeAdminPermission[] = request.getParameterValues("changeAdminPermission");
        DatabaseManager dbManager = new DatabaseManager();

        for (String editUser : changeSchedPermission) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificUserQuery(editUser);
            rs.beforeFirst();
            while (rs.next() != false) {
                boolean updateValue;
                if (rs.getBoolean("schedulingPermission") == true) {
                    updateValue = false;
                } else {
                    updateValue = true;
                }

                dbManager.updateSpecificUserSchedulingPermissionQuery(rs.getString("email"), updateValue);
            }
        }

        for (String editUser : changeAdminPermission) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificUserQuery(editUser);
            rs.beforeFirst();
            while (rs.next() != false) {
                boolean updateValue;
                if (rs.getBoolean("adminPermission") == true) {
                    updateValue = false;
                } else {
                    updateValue = true;
                }

                dbManager.updateSpecificUserAdminPermissionQuery(rs.getString("email"), updateValue);
            }
        }

        dbManager.closeCxn();

    } else if (request.getParameter("dropProposal") != null) {
        String dropProposals[] = request.getParameterValues("dropProposal");
        DatabaseManager dbManager = new DatabaseManager();

        for (String dropProposal : dropProposals) {
            ResultSet rs = null;
            //Get the user that was checked
            rs = dbManager.selectSpecificProposalQuery(dropProposal);
            rs.beforeFirst();
            while (rs.next() != false) {
                dbManager.deleteSpecificProposalQuery(rs.getString("requestID"));
            }
        }
        dbManager.closeCxn();

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head >

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; URL=adminhome.jsp">

        <title>Updating...</title>
    </head>
    <body>

        <p> Users Updated.. </p>

    </body>
</html>
