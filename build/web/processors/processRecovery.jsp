
<%@page import="org.mindrot.jbcrypt.BCrypt"%>

<%

    if (request.getParameter("recoverForm") != null) {

        DatabaseManager db = new DatabaseManager();

        ResultSet rs = null;
        rs = db.selectUserForRecoveryQuery(request.getParameter("email"), request.getParameter("fname"), request.getParameter("lname"), request.getParameter("univID"));
        rs.beforeFirst();
        if (rs.next() == false) {
            session.setAttribute("invalid", "invalid");
            db.closeCxn();
            response.sendRedirect("../user/passwordRecoverForm.jsp");
        } else {
            db.closeCxn();
            session.setAttribute("emailSet", request.getParameter("email"));
            response.sendRedirect("../user/changePassword.jsp");
        }
    } else if (request.getParameter("changedPassword") != null) {

        DatabaseManager db = new DatabaseManager();

        String newpword = request.getParameter("newpassword");

        // Hash a password for the first time
        BCrypt BCrypt = new BCrypt();

// gensalt's log_rounds parameter determines the complexity
// the work factor is 2**log_rounds, and the default is 10
        String salt = BCrypt.gensalt(12);
        String hashed = BCrypt.hashpw(newpword, salt);

        db.updatePasswordQuery(hashed, (String) session.getAttribute("emailSet"));
        session.removeAttribute("emailSet");
        //session.removeAttribute("confirmEmail");

        out.write("Your password has been changed...");
        response.setHeader("Refresh", "2;url=../user/login.jsp");
    }


%>

<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Confirmation</title>
    </head>
    <body>
        <p>

            <%            /*
                 if(session.getAttribute("confirm") != null)
                 {
                 out.write("Your password has been changed...");
                 }
        
                 */
            %>
        </p>
    </body>
</html>
