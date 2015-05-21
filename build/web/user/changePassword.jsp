<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Change Password - Observatory Scheduler</title>
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

            <h1 class="hero-heading">Change Password Form</h1>

        </div>
        <div class="w-section section grey" id="features">
            <%
                String emailAddress = (String) session.getAttribute("emailSet");
                out.write(emailAddress);
               // session.setAttribute("confirm", "confirm");
            %>

            <div class = 'loginDirections' >Enter a new password </div>

            <form action="../processors/processRecovery.jsp" method="POST" class="divvv" id="changePasswordForm" name="changedPassword" data-name="changedPassword">

                <input type="radio" style="display:none;" id="changedPassword" name="changedPassword" value="changedPassword" checked >




                <label class="label" for="#"><strong>New Password:</strong></label>
                <input class="inputw f" id="newpassword" type="password" placeholder="Password" name="newpassword" data-name="newpassword" required="required" autofocus="autofocus">
                <label class="label" for="#"><strong>Confirm New Password:</strong></label>
                <input class="inputw f" id="newpassword" type="password" placeholder="Password" name="confirmnewpassword" data-name="newpassword" required="required" autofocus="autofocus">


                <input id='changePasswordFormSubmit' class="buttonw thebut" type="submit" value="Submit" data-wait="Please wait...">
            </form>
        </div>
        <footer class="footer section">
            <div class="containerw">
                <div class="w-row">
                    <div class="colw colw-6">
                        <div class="footer-text">Prime Ascension</div>
                    </div>
                    <div class="colw colw-6 right-footer-col"><img src="images/siue.png" width="125" alt="siue.png"></div>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
    </body>
</html>