<%-- 
    Document   : administration
    Created on : Mar 12, 2015, 2:46:25 PM
    Author     : mattB
--%>

<%
    if(null == session.getAttribute("email")){
  // User is not logged in.
        response.sendRedirect("../user/login.jsp");
    }
    
    else if(session.getAttribute("adminPermission") != "yes")
    {
        //user does not have permission, so throw them back to their home
        session.setAttribute("nopermission2", "nopermission2");
        response.sendRedirect("../user/home.jsp");
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
                Home
             
            </p>
        </div>
    </div>


        <div class="w-section section grey" id="features">
           
              
                    <div class="w-clearfix requestform" data-name="Email Form">

          
          
                    <fieldset>
               <div id="currentUsersContainer"> 
                <h2>Current Users:</h2>
                <table border ="4" class ="table">
                    <tbody>
                        <tr bgcolor="#CCCCCC">
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
                            <td></td>
                        </tr>
                        <%
                            dbManager.closeCxn();

                        } else {
                            
                             int index = 0;
                            rs.beforeFirst();
                            while (rs.next()) {
                                String userEmail = rs.getString("email");
                                String firstName = rs.getString("firstName");
                                String lastName = rs.getString("lastName");
                                String section = rs.getString("section");
                        %>
                        <tr
                            
                         <%if((index%2)==0) {
                                out.write("bgcolor=\"#99CC99\"");
                                } else {
                                out.write("bgcolor =\"#99CC66\"");
                                }
                                %>   
                         >
                             <td><%out.print(section);%> </td>
                            <td><%out.print(userEmail);%> </td>
                            <td><%out.print(firstName);%></td>
                            <td><%out.print(lastName);%></td>
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

            </div>
                        
                        
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