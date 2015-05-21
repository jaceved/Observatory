

<%--
    Document   : CreateXML
    Created on : Nov 1, 2014, 10:23:17 PM
    Modfied    : February 5, 2015
    Author     : Jaime Acevedo

    Description: Creates an XML file by reading into the observatory database 
                 for specified times and parameters. After the variables have been 
                 read and stored. It is then written to a file and stored in a specified 
                 directory. The file generated is eventually uploaded to the telescope 
                 observatory loader.
--%>
<%@ page import="observatory.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*"%>
<%@ page import= "javax.xml.*" %>
<%@ page import= "org.w3c.dom.Attr" %>
<%@page import= "javax.xml.parsers.DocumentBuilderFactory" %>
<%@page import= "javax.xml.parsers.DocumentBuilder" %>
<%@page import= "javax.xml.parsers.ParserConfigurationException" %>
<%@page import= "javax.xml.transform.Transformer" %>
<%@page import= "javax.xml.transform.OutputKeys" %>
<%@page import= "javax.xml.transform.TransformerException" %>
<%@page import= "javax.xml.transform.TransformerFactory" %>
<%@page import= "javax.xml.transform.dom.DOMSource" %>
<%@page import= "javax.xml.transform.stream.StreamResult" %>

<%@ page import= "org.w3c.dom.Document" %>
<%@ page import= "org.w3c.dom.ProcessingInstruction" %>
<%@ page import= "org.w3c.dom.Element" %>

<%
    if(null == session.getAttribute("email")){
  // User is not logged in.
       response.sendRedirect("../user/login.jsp");
    }
    
    if(!response.isCommitted()) {
    if(session.getAttribute("adminPermission") != "yes")
    {
        response.sendRedirect("../user/home.jsp");
    }
    }
    %>


<html>
<head>
    <meta charset="utf-8">

    <title>Observatory Scheduler</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet"  type="text/css" href="../css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="../jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link href="../css/style2.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>
        <script>
            WebFont.load({
                google: {
                    families: ["Montserrat:400,700", "Varela Round:400", "Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic", "Varela:400"]
                }
            });
        </script>
    
</head>

<body>
    <header class="w-section nav-bar">
        <div class="w-container">
            <div class="w-row">
                <div class="w-col w-col-4 w-clearfix brand-column">
                    <img alt="54de3a4c1db7daaf1eb3843f_logo.png" class="logo"
                    src=
                    "../images/logo.png"
                    width="60">

                    <div class="company">
                        Observatory Scheduler
                    </div>
                </div>

                <nav class="w-col w-col-5 nav-column">
                        <a class="nav-link" href="../user/home.jsp">User Home</a>                        
                        <a class="nav-link" href="../processors/processLogOut.jsp">Logout</a>
                    </nav>       
                    <select id="AdminPagesadmintools" name="admintools" onchange="location = this.options[this.selectedIndex].value;">
                        <option value="#">Admin Tools</option>
                        <option value="adminhome.jsp">Admin Home</option>
                        <option value="addusers.jsp">Add Users</option>
                        <option value="dropusers.jsp">Delete Users</option>
                        <option value="editusers.jsp">Edit Users</option>
                        <option value="dropProposals.jsp">Delete Proposals</option>
                        <option value="addPictures.jsp">Add Pictures</option>
                        <option value="CreateXML.jsp">Create XML File</option>
                    </select>
            </div>
        </div>
    </header>
    
    <div class="w-section section hero">
        <div class="w-container c1">
            <h1 class="hero-heading">Download File</h1>

            <p class="hero-subhead">
                Your proposal file is now ready to be downloaded. 
             
            </p>
        </div>
    </div>

    <div class="w-section section grey" id="features">
        <div class="requestblock">
            <div class="w-form">
                <div class="w-clearfix requestform" data-name="">
        <%
             int H, M;
         

                 
           if (request.getParameter("hrs").equalsIgnoreCase("") || request.getParameter("hrs") == null) { 
               H=0;
           }else
             H = Integer.parseInt(request.getParameter("hrs").toString());
        
           if (request.getParameter("mins").equalsIgnoreCase("")|| request.getParameter("mins") == null) { 
               M=0;
           } else
             M = Integer.parseInt(request.getParameter("mins").toString());
           
            CreateXML fileCreator = new CreateXML(pageContext.getOut(),H,M);
            fileCreator.createFile();
 
    
        %>


     
                      </div>

    
      </div >
  

            </div>
        </div>
    

    
    
    
    
    
    
    
    
    
    
    <footer class="w-section section footer">
        <div class="w-container">
            <div class="w-row">
                <div class="w-col w-col-6">
                    <div class="footer-text">
                        Prime Ascension
                    </div>
                </div>

                <div class="w-col w-col-6 right-footer-col"><img alt=
                "siue.png" src=
                "images/siue.png"
                width="125"></div>
            </div>
        </div>
        
        
    </footer><script src=
    "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type=
    "text/javascript"></script> 
<!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>