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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script><script>WebFont.load({
            google: {
              families: ["Montserrat:400,700","Varela Round:400","Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic","Varela:400"]
            }
            });
        </script>
    </head>
    <body>
        <header class="w-section nav-bar">
            <div class="w-container">
                <div class="w-row">
                    <div class="w-col w-col-4 w-clearfix brand-column">
                        <img class="logo" src="images/logo.png" width="60" alt="logo">
                        <div class="company">Observatory Scheduler</div>
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
                <h1 class="hero-heading">Proposal Form</h1>
                <p class="hero-subhead">Complete the form to create your observation request.&nbsp;&nbsp;Be sure to double check your inputs to ensure there are no mistakes in order to accurately capture your images!</p>
            </div>
        </div>
        <div class="w-section section grey" id="features">
            <div class="requestblock">
                <div class="w-form">
                    <form class="w-clearfix requestform" action="processRequest.jsp" method="POST">
                        <div class="w-clearfix radep">
                            <label class="fieldlabel1" for="ra">&nbsp;Right Ascension&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <label class="fieldlabel1 r" for="d">Epoch</label>
                            <label class="fieldlabel1 c" for="degDec">Declination</label>
                            <input class="w-input tf_2" id="degDec" type="text" placeholder="dd" pattern ="[-90-90]{1,2}" title="Please Enter a value [-90 - 90]" name="degDec" required="required" data-name="degDec">
                            <input class="w-input tf_2" id="minDec" type="text" placeholder="mm" pattern ="[0-59]{1,2}" title="Please Enter a value [0 - 59]" name="minDec" required="required" data-name="minDec">
                            <input class="w-input tf_2" id="secDec" type="text" placeholder="ss" pattern ="[0-59]{1,2}" title="Please Enter a value [0 - 59]" name="secDec" required="required" data-name="secDec">
                            <input class="w-input tf_3" id="epoch" type="text" placeholder="Ex. 2015.1" name="epoch" required="required" data-name="epoch">
                            <input class="w-input textfield l" id="hourAsc" type="text" placeholder="hh" pattern ="[0-23]{1,2}" title="Please Enter a value [0 - 23]" name="hourAsc" required="required" data-name="hourAsc">
                            <input class="w-input textfield l" id="minAsc" type="text" placeholder="mm" pattern ="[0-59]{1,2}" title="Please Enter a value [0 - 59]" name="minAsc" required="required" data-name="minAsc">
                            <input class="w-input textfield l" id="secAsc" type="text" placeholder="ss" pattern ="[0-59]{1,2}" title="Please Enter a value [0 - 59]" name="secAsc" required="required" data-name="secAsc">
                        </div>
                        <div class="w-clearfix middiv">
                            <label class="l1" for="ra-2">Image</label>
                            <label class="l1" for="ra-2">Filter</label>
                            <label class="l1 llong" for="field">Exposure</label>
                            <div class="nums">
                                <label class="filter-number" for="None-4">1</label>
                                <label class="filter-number" for="None-4">2</label>
                                <label class="filter-number" for="None">3</label>
                                <label class="filter-number" for="None-4">4</label>
                                <label class="filter-number" for="None-4">5</label>
                            </div>
                            <div class="exp-div">
                                <select class="w-select selectfilter" id="p" name="p1" data-name="p1">
                                    <option value="None">None</option>
                                    <option value="U">U</option>
                                    <option value="B">B</option>
                                    <option value="V">V</option>
                                    <option value="R">R</option>
                                </select>
                                <select class="w-select selectfilter" id="p-2" name="p2" data-name="p2">
                                    <option value="None">None</option>
                                    <option value="U">U</option>
                                    <option value="B">B</option>
                                    <option value="V">V</option>
                                    <option value="R">R</option>
                                </select>
                                <select class="w-select selectfilter" id="p-3" name="p3" data-name="p3">
                                    <option value="None">None</option>
                                    <option value="U">U</option>
                                    <option value="B">B</option>
                                    <option value="V">V</option>
                                    <option value="R">R</option>
                                </select>
                                <select class="w-select selectfilter" id="p-4" name="p4" data-name="p4">
                                    <option value="None">None</option>
                                    <option value="U">U</option>
                                    <option value="B">B</option>
                                    <option value="R">R</option>
                                    <option value="V">V</option>
                                </select>
                                <select class="w-select selectfilter" id="p-5" name="p5" data-name="p5">
                                    <option value="None">None</option>
                                    <option value="U">U</option>
                                    <option value="B">B</option>
                                    <option value="R">R</option>
                                    <option value="V">V</option>
                                </select>
                            </div>
                            <input class="w-input et11" id="et"  type="number" placeholder="ex. 500" name="et1" data-name="et1">
                            <input class="w-input et11" id="et-2" type="number" name="et2"  data-name="et2">
                            <input class="w-input et11" id="et-3" type="number" name="et3"  data-name="et3">
                            <input class="w-input et11" id="et-4" type="number" name="et4" data-name="et4">
                            <input class="w-input et11" id="et-5" type="number" name="et5" data-name="et5">
                        </div>
                        <div class="w-clearfix titlediv"><label class="kk" for="count">Count:&nbsp;</label>
                            <input class="w-input gg" id="count" type="number" placeholder="#" required="required" data-name="count" name="count">
                            <label class="kk" for="angle">Angle:&nbsp;</label>
                            <input class="w-input gg" id="angle" type="number" placeholder="#" required="required" data-name="angle" name="angle">
                            <label class="kk" for="target-2">Target:&nbsp;</label>
                            <input class="w-input gg" id="target-2" type="number" placeholder="#" required="required" data-name="target" name="target">
                            <label class="kk" for="repeat">Repeat:&nbsp;</label>
                            <input class="w-input gg" id="repeat" type="number" placeholder="#" required="required" data-name="repeat" name="repeat">
                            <label class="kk" for="frame-3">Frame:&nbsp;</label>
                            <input class="w-input gg" id="frame-3" type="number" placeholder="#" required="required" data-name="frame" name="frame">
                            <label class="kk" for="binning">Binning:</label>
                            <input class="w-input gg" id="binning" type="number" placeholder="#" required="required" data-name="binning" name="binning">
                        </div>
                        <input class="w-button but" type="submit" value="Submit" data-wait="Please wait...">
                    </form>
                    <div class="w-form-done">
                        <p>Thank you! Your submission has been received!</p>
                    </div>
                    <div class="w-form-fail">
                        <p>Oops! Something went wrong while submitting the form :(</p>
                    </div>
                </div>
            </div>
        </div>
        <footer class="w-section section footer">
            <div class="w-container">
                <div class="w-row">
                    <div class="w-col w-col-6">
                        <div class="footer-text">Prime Ascension</div>
                    </div>
                    <div class="w-col w-col-6 right-footer-col"><img src="images/siue.png" width="125" alt="siue"></div>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </body>
</html>