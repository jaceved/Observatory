<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login - Observatory Scheduler</title>
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

            <h1 class="hero-heading">Password Recovery Form</h1>

        </div>
        <div class="w-section section grey" id="features">

            <div class = 'loginDirections' >Enter the following information. Note: you can only change your password if your account is a permanent one (i.e., has been approved by an administrator) </div>

            
             <div id="recoverAlert">
                <p class="recoveryAlertText"> <%
                    if (session.getAttribute("invalid") != null) {
                        out.write("Information that doesn't match our records was entered");

                        session.removeAttribute("invalid");
                    }
                    %></p>
            </div>
            
            <form action="../processors/processRecovery.jsp" method="POST" class="divvv" id="recoveryForm" name="recoveryForm" data-name="recoveryForm">

                 <input type="radio" style="display:none;" id="recoverForm" name="recoverForm" value="recoverForm" checked >

                <label class="label" for="email-2"><strong>Email:</strong></label>
                <input class="inputw f" id="email" type="text" placeholder="Enter your email address" name="email" data-name="email" required="required" autofocus="autofocus">
                <label class="label" for="email-2"><strong>First Name:</strong></label>
                <input class="inputw f" id="fname" type="text" placeholder="First Name (Case Sensitive)" name="fname" data-name="email" required="required" autofocus="autofocus">
                <label class="label" for="email-2"><strong>Last Name:</strong></label>
                <input class="inputw f" id="lname" type="text" placeholder="Last Name (Case Sensitive)" name="lname" data-name="email" required="required" autofocus="autofocus">
                <label class="label" for="password"><strong>University ID:</strong></label>
                <input class="inputw f" id="univID" type="text" placeholder="800 Number" name="univID" data-name="password" required="required">
                
                <input id='recoveryFormSubmit' class="buttonw thebut" type="submit" value="Submit" data-wait="Please wait...">
            </form>


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