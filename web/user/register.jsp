

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Register - Observatory Scheduler</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap-min.css">
        <link rel="stylesheet" type="text/css" href="../css/style2.css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script><script>WebFont.load({
                google: {
                    families: ["Montserrat:400,700", "Varela Round:400", "Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic", "Varela:400"]
                }
            });</script>
    </head>
    
    <body>
        <header class="nav-bar">
            <div class="containerw">
                <div class="w-row">
                    <div class="colw colw-4 clearfixw brand-column">
                        <img class="logo" src="../images/logo.png" width="60" alt="logo.png">
                        <div class="company">Observatory Scheduler</div>
                    </div>
                    <nav class="colw colw-8 nav-column"></nav>
                </div>
            </div>
        </header>

        <div class="w-section section hero">

            <h1 class="hero-heading">User Registration</h1>

        </div>
        <div class="w-section section grey" id="features">


            <div> Fill out the form to create an account </div>
             
            <fieldset>
            <form action="../processors/processRegistration.jsp" method="POST" class="divvv" id="loginForm" name="email-form9" data-name="Email Form">
                <p class="loginAlertText"><%
                 if(session.getAttribute("nomatch") != null)
                 {
                     out.write("The two passwords you entered do not match");
                     session.removeAttribute("nomatch");
                 }
                 
                 if(!response.isCommitted()) {
                 if(session.getAttribute("userfound") != null)
                 {
                     out.write("You already have an account");
                     session.removeAttribute("userfound");
                 }
                 }
                 %></p>

                <div id="regChunk1">
                <label class="label" for="email-2"><strong>SIUE Email:</strong></label>
                <input class="inputw w" id="email-2" type="text" placeholder="Enter your SIUE email address" name="email" data-name="email" required="required" autofocus="autofocus">
                <label class="label" for="eID"><strong>e-id:</strong></label>
                <input class="inputw w" id="eID" type="text" placeholder="Enter your e-id" name="eID" data-name="eID" required="required">
                </div>
                
                <div id="regChunk2">
                <label class="label" for="password"><strong>University ID:</strong></label>
                <input class="inputw w" id="univID" type="text" placeholder="Enter your 800 number" name="univID" data-name="univID" required="required">
                <label class="label" for="password"><strong>Section Number:</strong></label>
                <input class="inputw w" id="sectionID" type="text" placeholder="Enter your 3-digit section number" name="sectionID" data-name="sectionID" required="required">
                </div>
                
                <div id ="regChunk3">
                <label class="label" for="fname"><strong>First Name:</strong></label>
                <input class="inputw w" id="fname" type="text" placeholder="Enter your first name" name="fname" data-name="fname" required="required">
                <label class="label" for="lname"><strong>Last Name:</strong></label>
                <input class="inputw w" id="fname" type="text" placeholder="Enter your last name" name="lname" data-name="lname" required="required">
                
                </div>
                
                           
                <div id="regChunk4">
                <label class="label" for="password"><strong>Password:</strong></label>
                <input class="inputw w" id="password" type="password" placeholder="Enter a password" name="password" data-name="password" required="required">
                <label class="label" for="password"><strong>Confirm Password:</strong></label>
                <input class="inputw w" id="pwordconfirm" type="password" placeholder="Confirm your password" name="pwordconfirm" data-name="pwordconfirm" required="required">
                </div>
                
                <input id='registrationSubmit' class="buttonw thebut" type="submit" value="Submit" data-wait="Please wait...">
            </form>
            </fieldset>

        </div>


        <footer class="footer section">
            <div class="containerw">
                <div class="w-row">
                    <div class="colw colw-6">
                        <div class="footer-text">Prime Ascension</div>
                    </div>
                    <div class="colw colw-6 right-footer-col"><img src="../images/siue.png" width="125" alt="siue.png"></div>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->        
    </body>
</html>
