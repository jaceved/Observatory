<%-- 
    Document   : home
    Created on : Nov 9, 2014, 9:06:48 PM
    Author     : Jaime Acevedo
--%>
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
                        <a class="nav-link" href="home.jsp">Home</a>
                        <a class="nav-link" href="proposal.jsp">Create Proposal</a>
                        <a class="nav-link" href="processLogOut.jsp">Logout</a>
                          <a class="nav-link" href="admin/adminhome.jsp">Admin Tools</a>
                        
                        
                    </nav>
                </div>
            </div>
        </header>

        <div class="w-section section hero">
            <div class="w-container c1">
                <br>

                <h1 class="hero-heading"> <% out.print("Welcome, " + session.getAttribute("email").toString());%></h1>

                <p class="hero-subhead">
                    Welcome to the SIUe Astronomy Observatory Scheduler. Here, you can easily
                    propose observation times and view your pictures. 

                </p>
            </div>
        </div>
        <br>
        <br>
        <br>

        <br>
        <br>
        <br>
        <br> <br>

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <h1>
                        Create Proposal
                    </h1>
                    <p>
                        You may submit a proposal through the new SIUE 
                        observatory scheduler system. Just click the link below
                        and fill in the desired parameters. Once submitted it will
                        go through an approval process and ultimately put in a 
                        queue for processing. It's that easy!
                    </p>
                    <p>
                        <a class="btn" href="proposal.jsp">New Proposal »</a>
                    </p>
                </div>
                <div class="col-md-6 column">
                    <h1>
                        View Pictures
                    </h1>
                    <p>
                        After your your observation has been processed by the telescope
                        and the admin has uploaded your pictures. You can be able to see
                        the results. Pictures are labeled properly and organized by 
                        observation date.
                    </p>
                    <p><br>
                        <a class="btn" href="#">See Results »</a>
                    </p>
                </div>
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
    </footer>
    <script src=
            "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type=
    "text/javascript"></script> 
    <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
</body>
</html>
