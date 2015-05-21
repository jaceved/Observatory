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

            <h1 class="hero-heading">Welcome to the Physics Department's Observatory Scheduler</h1>

        </div>
        <div class="w-section section grey" id="features">




            <div id="loginAlert">
                <p class="loginAlertText"> <%
                    if (session.getAttribute("alertuser") != null) {
                        out.write("Invalid credentials. Please try again.");

                        session.removeAttribute("alertuser");
                    }
                    %></p>
            </div>
            <div class = 'loginDirections' >Log in below or click <a href="register.jsp">here</a> to register.</div>

            <form action="../processors/processlogin.jsp" method="POST" class="divvv" id="loginForm" name="email-form9" data-name="Email Form">



                <label class="label" for="email-2"><strong>Email:</strong></label>
                <input class="inputw f" id="email-2" type="text" placeholder="Enter your email address" name="email" data-name="email" required="required" autofocus="autofocus">
                <label class="label" for="password"><strong>Password:</strong></label>
                <input class="inputw f" id="password" type="password" placeholder="Enter your password" name="password" data-name="password" required="required">
                <a id='recoverLink' href="passwordRecoverForm.jsp">Forgot password?</a>
                <input id='loginSubmit' class="buttonw thebut" type="submit" value="Submit" data-wait="Please wait...">
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