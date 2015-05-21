




<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <title>Observatory Scheduler</title>
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style2.css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script><script>WebFont.load({
                google: {
                    families: ["Montserrat:400,700", "Varela Round:400", "Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic", "Varela:400"]
                }
            });


            function alertNoSchedPermission() {
                alert("You do not have permssion to create proposals at this time. Please contact an administrator.");
            }

            function alertNoAdminPermission() {
                alert("This is for administrators only. You do not have permission to access it.");
            }

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

                    <nav class="w-col w-col-8 nav-column">
                        <a class="nav-link" href="home.jsp">Home</a>
                        <a class="nav-link" href="proposal.jsp">Create Proposal</a>
                        <a class="nav-link" href="yourObservations.jsp">My Pictures</a>
                        <a class="nav-link" href="../processors/processLogOut.jsp">Logout</a>
                        

                    </nav>       
                    <select id="admintools" name="admintools" onchange="location = this.options[this.selectedIndex].value;">
                        <option value="#">Admin Tools</option>
                        <option value="../admin/adminhome.jsp">Admin Home</option>
                        <option value="../admin/addusers.jsp">Add Users</option>
                        <option value="../admin/dropusers.jsp">Delete Users</option>
                        <option value="../admin/editusers.jsp">Edit Users</option>
                        <option value="../admin/dropProposals.jsp">Delete Proposals</option>
                        <option value="../admin/addPictures.jsp">Add Pictures</option>
                        <option value="../admin/CreateFile.jsp">Create File</option>
                    </select>


                </div>
            </div>
        </header>

        <div class="w-section section hero">
            <div class="w-container c1">
                <br>

                <h1 class="hero-heading"> 

                    <%
                        if (session.getAttribute("email") == null) {
                            // User is not logged in.

                            response.sendRedirect("login.jsp");
                        } else {

                            out.print("Welcome, " + session.getAttribute("email").toString());
                        }

                        if (session.getAttribute("nopermission") != null) {
                    %>
                    <script type="text/javascript"> alertNoSchedPermission();</script>


                    <%
                            session.removeAttribute("nopermission");
                        }

                        if (session.getAttribute("nopermission2") != null) {
                    %>
                    <script type="text/javascript"> alertNoAdminPermission();</script>


                    <%
                            session.removeAttribute("nopermission2");
                        }

                    %>
                </h1> 

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
                        <a class="btn" href="yourObservations.jsp">See Results »</a>
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
                                                                     "../images/siue.png"
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
