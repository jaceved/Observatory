<%-- 
    Document   : CreateFile
    Created on : Mar 19, 2015, 6:15:48 PM
    Author     : Jaime Acevedo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(null == session.getAttribute("email")){
  // User is not logged in.
        request.getRequestDispatcher("/login.html").forward(request,response);
}
    %>
<html>
    <head>
        <meta charset="utf-8">

        <title>Observatory Scheduler</title>
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href="css/style.css"
              rel="stylesheet" type="text/css">
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
                             "images/logo.png"
                             width="60">

                        <div class="company">
                            Observatory Scheduler
                        </div>
                    </div>

                    <nav class="w-col w-col-8 nav-column">
                        
                        <a class="nav-link" href="home.jsp">User Home</a>
                        <a class="nav-link" href="proposal.jsp">Create Proposal</a>
                        <a class="nav-link" href="processlogin.jsp">Logout</a>
                    </nav>
                </div>
            </div>
        </header>

        <div class="w-section section hero">
            <div class="w-container c1">
                <h1 class="hero-heading">Generate XML Files for Telescope</h1>

                <p class="hero-subhead">
                    Click the below button to generate the collected proposal times
                    from all students! Please specify a start time from now to begin 
                    observation.
                    <br>
                    (Hours or Minutes).
                </p>
            </div>
        </div>

        <div class="w-section section grey" id="features">
            <div class="requestblock">
                <div class="w-form">
                    <div class="w-clearfix requestform" data-name="Email Form">

                        <br>
                        <br>

                        <form action="CreateXML.jsp" method="POST" >
                        <h3> <label >Hours (From Now)</label> 
                            <input type="text" style="width: 50px; text-align: center;" placeholder="HH" name="hrs">

                            <br>
                            <br>

                            <label > Minutes (From Now) </label>
                            <input type="text" style="width: 50px; text-align: center" placeholder="MM"  name="mins">



                            <br>
                            <br>
                            
                            <input type="submit" value="Generate" class="btn btn-success">
                        </h3>
                       </form>

                    </div >

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