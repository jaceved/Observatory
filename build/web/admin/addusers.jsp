
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
                Add Users
             
            </p>
        </div>
    </div>


        <div class="w-section section grey" id="features">
           
              
                    <div class="w-clearfix requestform" data-name="Email Form">

                        
            <fieldset>
                <h2>Add a User Manually</h2>
                <form id ="addForm" action="adminupdates.jsp" method="POST">
                    

                    <div id="addUserLeftChunk">
                        <label>email:
                        <input type="text" name="email" required="required"></label>
                       <label>e-id:
                        <input type="text" name="eID" required="required"></label>
                        <label>University ID:
                         <input type="text" name="universityID" required="required"></label>
                        <label>Section:
                         <input type="text" name="section" required="required"></label>
                    </div>
                    <div id="addUserRightChunk">
                        <label>First Name:
                        <input type="text" name="firstName" required="required"></label>
                        <label>Last Name:
                         <input type="text" name="lastName" required="required"></label>
                        <label>Temp Password:
                         <input type="text" name="tempPassword" required="required"></label>                     
                        <label>Priority:
                         <input type="text" name="priority" required="required"></label>
                    </div>

                        <input type="radio" style="display: none;" id="insertuser" name="insertuser" value="insertuser" checked >

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <button type="reset" class="btn btn-danger">Cancel</button>
                        </div>
                   
                </form>
                </fieldset>
                        <div >
                  <fieldset id = "addTempUsersDiv">  
                <h2>Temporary Users (Need Approval):</h2>

                <form id ="tempUserForm" action="adminupdates.jsp" method="POST">
                
                    <input type="radio" style="display: none;" id="insertTempUser" name="insertTempUser" value="insertTempUser" checked >

                    <table border="4" class ="table">
                        <tbody>
                            <tr bgcolor="#CCCCCC">
                                <th>Add Temporary Users to Current Users Table? <br><input onclick="" type="checkbox" name="checkAll" value="checkAll"> Select All</th>
                                <th>Section</th>
                                <th>Email</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                            </tr>
                            <%
                                DatabaseManager dbManager2 = new DatabaseManager();

                                ResultSet rs2 = dbManager2.selectAllTempUsersQuery();

                                rs2.beforeFirst();
                            if (rs2.next() == false) {
                            %>
                            <tr>
                                <%out.print("No temporary users at this time");%>     
                                
                            </tr>
                            <%
                                dbManager2.closeCxn();
                               
                            } else {

                                String[] emails = new String[1000];

                               
                                int index = 0;
                                rs2.beforeFirst();
                                while (rs2.next()) {

                                    String userEmail2 = rs2.getString("email");
                                    String firstName2 = rs2.getString("firstName");
                                    String lastName2 = rs2.getString("lastName");
                                    String section = rs2.getString("section");
                                    emails[index] = userEmail2;
                            %>
                            <tr bgcolor = "#FF9999">   
                                <td>
                                    <input type="checkbox" name="addUser" value="<%out.write(emails[index]);%>"> Add temporary user
                                   

                                </td>
                                <td><%out.print(section);%> </td>
                                <td><%out.print(userEmail2);%> </td>
                                <td><%out.print(firstName2);%></td>
                                <td><%out.print(lastName2);%></td> 

                            </tr>

                            <%
                                    index++;
                                }

                                dbManager2.closeCxn();

                            %>
                        </tbody>
                    </table>

                    <%                        }
                    %>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-danger">Cancel</button>
                    </div>
                
                </form>
   </fieldset>
                        </div>
                    
                    <div >
                    <fieldset id="addCurrentUsersDiv">
                <h2>Current Users:</h2>


                <table id="addUsersCurrentUsersTable" border="4" class ="table">
                    <tbody>
                        <tr border ="4" bgcolor="#CCCCCC">
                            <th>Section</th>
                            <th>Email</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                        </tr>
                        <%
                            DatabaseManager dbManager = new DatabaseManager();
                            ResultSet rs = dbManager.selectAllUsersQuery();
                            
                            rs.beforeFirst();
                                if (rs.next() == false) {
                            %>
                            <tr>
                                <td><%out.print("There are no users in the system");%> </td>     
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <%
                                dbManager.closeCxn();

                            } else {
                            
                            
                            rs.beforeFirst();
                            while (rs.next()) {
                                String userEmail = rs.getString("email");
                                String firstName = rs.getString("firstName");
                                String lastName = rs.getString("lastName");
                                String section = rs.getString("section");
                         %>
                                <tr bgcolor="#99FF99">
                                <td><%out.print(section);%> </td>
                                <td><%out.print(userEmail);%> </td>
                                <td><%out.print(firstName);%></td>
                                <td><%out.print(lastName);%></td>
                                </tr>

                        <%
                            }
                            dbManager.closeCxn();
                                
                        %>
                    </tbody>
                </table>
                    <%
                                }
                    %>
                   
                        </fieldset>
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