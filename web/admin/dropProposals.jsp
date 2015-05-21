<%-- 
    Document   : currentproposals
    Created on : Mar 28, 2015, 7:10:58 PM
    Author     : Matt
--%>

<%
    if(null == session.getAttribute("email")){
  // User is not logged in.
        response.sendRedirect("../user/login.jsp");
}
    if(!response.isCommitted()) {
    if(session.getAttribute("adminPermission") != "yes")
    {
        //user does not have permission, so throw them back to their home
        response.sendRedirect("../user/home.jsp");
    }
    }
    %>
<html>
    <head>
        <meta charset="utf-8">
        <%@ page import ="java.io.*, java.sql.*" %>
        <%@ page import ="observatory.*" %>
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
                        <option value="CreateFile.jsp">Create File</option>
                    </select>
                </div>
            </div>
        </header>


        <div class="w-section section hero">
            <div class="w-container c1">
                <h1 class="hero-heading">Welcome, Admin</h1>

                <p class="hero-subhead">
                    Drop Proposals Before Scheduling

                </p>
            </div>
        </div>


        <div class="w-section section grey" id="features">


            <!-- <div class="w-clearfix requestform" data-name="Email Form"> -->

            <div id="currentRequestsContainer"> 
                <fieldset>
                    <form id ="dropProposalForm" action="adminupdates.jsp" method="POST">
                        <input type="radio" style="display:none;" id="dropProposal" name="dropProposal" value="dropProposal" checked >

                        <h2>Current Requests:</h2>
                        <table border="4" class ="table">
                            <tbody>
                                <tr bgcolor="#CCCCCC">
                                    <th>Delete?<br><input onclick="" type="checkbox" name="checkAll" value="checkAll"> Select All</th>
                                    <th>Request ID</th>
                                    <th>Start Date</th>
                                    <th>Start Time</th>
                                    <th>Target</th>
                                    <th>ID</th>
                                    <th>RA</th>
                                    <th>DC</th>
                                    <th>Angle</th>
                                    <th>Repeat</th>
                                    <th>Frame</th>
                                    <th>Filter</th>
                                    <th>Exposure</th>
                                    <th>Binning</th>
                                    <th>Count</th>
                                </tr>
                                <%

                                    DatabaseManager dbManager = new DatabaseManager();
                                    ResultSet rs = dbManager.selectAllObservationsQuery();

                                    rs.beforeFirst();
                                    if (rs.next() == false) {
                                %>
                                <tr>
                                    <td><%out.print("There are no proposals in the system");%> </td>     
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%
                                    dbManager.closeCxn();

                                } else {

                                    String[] proposals = new String[1000];
                                    int index = 0;
                                   
                                    rs.beforeFirst();
                                    while (rs.next()) {
                                        String requestID = rs.getString("requestID");
                                         proposals[index] = requestID;
                                        String startDate = rs.getString("STARTDATE");
                                        String startTime = rs.getString("STARTTIME");
                                        String target = rs.getString("TARGET");
                                        String id = rs.getString("ID");
                                        String ra = rs.getString("RA");
                                        String dc = rs.getString("DC");
                                        String angle = rs.getString("ANGLE");
                                        String repeat = rs.getString("REPEAT");
                                        String frame = rs.getString("FRAME");
                                        String filter = rs.getString("FILTER");
                                        String exposure = rs.getString("EXPOSURE");
                                        String binning = rs.getString("BINNING");
                                        String count = rs.getString("COUNT");
                                %>     
                                <tr
                                <%if((index%2)==0) {
                                out.write("bgcolor=\"99CCCC\"");
                                } else {
                                out.write("bgcolor =\"#CC9999\"");
                                }
                                %>
                                >
                                    <td><input type="checkbox" name="dropProposal" value="<%out.write(proposals[index]);%>"> delete proposal</td>
                                    <td><%out.print(requestID);%> </td>
                                    <td><%out.print(startDate);%></td>
                                    <td><%out.print(startTime);%></td>
                                    <td><%out.print(target);%></td>
                                    <td><%out.print(id);%></td>
                                    <td><%out.print(ra);%></td>
                                    <td><%out.print(dc);%></td>
                                    <td><%out.print(angle);%></td>
                                    <td><%out.print(repeat);%></td>
                                    <td><%out.print(frame);%></td>
                                    <td><%out.print(filter);%></td>
                                    <td><%out.print(exposure);%></td>
                                    <td><%out.print(binning);%></td>
                                    <td><%out.print(count);%></td>
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

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="reset" class="btn btn-danger">Cancel</button>
                        </div>
                    </form>
                </fieldset>

                <!--        </div>-->
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
    </body>


</html>