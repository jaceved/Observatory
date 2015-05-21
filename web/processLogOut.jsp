<%-- 
    Document   : processLogOut
    Created on : Apr 21, 2015, 7:49:28 PM
    Author     : Jaime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%
    HttpSession Usession = request.getSession(false);
if(Usession != null)
    Usession.invalidate();
request.getRequestDispatcher("/login.html").forward(request,response);


%>