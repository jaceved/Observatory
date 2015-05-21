
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.*, java.sql.*" %>
<%@ page import ="observatory.*" %>

<!DOCTYPE html>
<%
    if (null == session.getAttribute("email")) {
        // User is not logged in.
        response.sendRedirect("login.jsp");
    }


%>
<html>
    <head>
        <meta charset="utf-8">

        <title>Observatory Scheduler</title>
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <!-- Latest compiled and minified CSS -->
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
                        <img class="logo" src="../images/logo.png" width="60" alt="logo">
                        <div class="company">Observatory Scheduler</div>
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
                <h1 class="hero-heading">Your Pictures</h1>

                <p class="hero-subhead">
                    Click the links below to download your pictures

                    <br>

                </p>
            </div>
        </div>
        <fieldset>
            <form>
                <div class="w-section section grey" id="features">

                    <div class="requestblock">

                        <div class="w-form">

                            <div class="w-clearfix requestform" data-name="Email Form">


                                <table border ="4" class ="table">
                                    <tbody>
                                        <tr bgcolor="#CCCCCC">

                                            <th>Request Number</th>
                                            <th>Image Type</th>
                                            <th>Link</th>
                                        </tr>
                                        <%                            String email = (String) session.getAttribute("email");
                                            DatabaseManager dbManager = new DatabaseManager();
                                            ResultSet rs = dbManager.selectAllUserPicturesQuery(email);

                                            rs.beforeFirst();
                                            if (rs.next() == false) {
                                        %>
                                        <tr>
                                            <td><%out.print("There are no pictures for you in the system");%> </td>     
                                            <td></td>
                                            <td></td>

                                        </tr>
                                        <%
                                            dbManager.closeCxn();

                                        } else {

                                            int index = 0;
                                            rs.beforeFirst();
                                            while (rs.next()) {
                                                String imageType = rs.getString("imageType");
                                                String requestID = rs.getString("requestID");
                                                String loc = rs.getString("pictureLoc");
                                        %>
                                        <tr

                                            <%if ((index % 2) == 0) {
                                                    out.write("bgcolor=\"#99CC99\"");
                                                } else {
                                                    out.write("bgcolor =\"#99CC66\"");
                                                }
                                            %>   
                                            >
                                            <td><%out.print(requestID);%> </td>
                                            <td><%out.print(imageType);%></td>
                                            <td><a href="#"><%out.print(loc);%> </a></td>
                                        </tr>

                                        <%
                                                index++;
                                            }
                                            dbManager.closeCxn();
                                        %>
                                    </tbody>
                                </table>
                                <%
                                    }
                                %>

                            </div >


                        </div >

                    </div>

                </div>

            </form>
        </fieldset>

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