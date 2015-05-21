package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class proposal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");

    if(null == session.getAttribute("email")){
  // User is not logged in.
        request.getRequestDispatcher("/login.html").forward(request,response);
}
    
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Observatory Scheduler</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style1.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js\"></script><script>WebFont.load({\n");
      out.write("            google: {\n");
      out.write("              families: [\"Montserrat:400,700\",\"Varela Round:400\",\"Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic\",\"Varela:400\"]\n");
      out.write("            }\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header class=\"w-section nav-bar\">\n");
      out.write("            <div class=\"w-container\">\n");
      out.write("                <div class=\"w-row\">\n");
      out.write("                    <div class=\"w-col w-col-4 w-clearfix brand-column\">\n");
      out.write("                        <img class=\"logo\" src=\"images/logo.png\" width=\"60\" alt=\"logo\">\n");
      out.write("                        <div class=\"company\">Observatory Scheduler</div>\n");
      out.write("                    </div>\n");
      out.write("                           <nav class=\"w-col w-col-8 nav-column\">\n");
      out.write("                        <a class=\"nav-link\" href=\"home.jsp\">Home</a>\n");
      out.write("                        <a class=\"nav-link\" href=\"proposal.jsp\">Create Proposal</a>\n");
      out.write("                        <a class=\"nav-link\" href=\"processLogOut.jsp\">Logout</a>\n");
      out.write("                        <a class=\"nav-link\" href=\"admin/adminhome.jsp\">Admin Tools</a>\n");
      out.write("                     \n");
      out.write("\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <div class=\"w-section section hero\">\n");
      out.write("            <div class=\"w-container c1\">\n");
      out.write("                <h1 class=\"hero-heading\">Proposal Form</h1>\n");
      out.write("                <p class=\"hero-subhead\">Complete the form to create your observation request.&nbsp;&nbsp;Be sure to double check your inputs to ensure there are no mistakes in order to accurately capture your images!</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"w-section section grey\" id=\"features\">\n");
      out.write("            <div class=\"requestblock\">\n");
      out.write("                <div class=\"w-form\">\n");
      out.write("                    <form class=\"w-clearfix requestform\" action=\"processRequest.jsp\" method=\"POST\">\n");
      out.write("                        <div class=\"w-clearfix radep\">\n");
      out.write("                            <label class=\"fieldlabel1\" for=\"ra\">&nbsp;Right Ascension&nbsp;&nbsp;&nbsp;&nbsp;</label>\n");
      out.write("                            <label class=\"fieldlabel1 r\" for=\"d\">Epoch</label>\n");
      out.write("                            <label class=\"fieldlabel1 c\" for=\"degDec\">Declination</label>\n");
      out.write("                            <input class=\"w-input tf_2\" id=\"degDec\" type=\"text\" placeholder=\"dd\" pattern =\"[0-90]{1,2}\" name=\"degDec\" required=\"required\" data-name=\"degDec\">\n");
      out.write("                            <input class=\"w-input tf_2\" id=\"minDec\" type=\"number\" placeholder=\"mm\" name=\"minDec\" required=\"required\" data-name=\"minDec\">\n");
      out.write("                            <input class=\"w-input tf_2\" id=\"secDec\" type=\"number\" placeholder=\"ss\" name=\"secDec\" required=\"required\" data-name=\"secDec\">\n");
      out.write("                            <input class=\"w-input tf_3\" id=\"epoch\" type=\"number\" placeholder=\"Ex. 2015.1\" name=\"epoch\" required=\"required\" data-name=\"epoch\">\n");
      out.write("                            <input class=\"w-input textfield l\" id=\"hourAsc\" type=\"number\" placeholder=\"hh\" name=\"hourAsc\" required=\"required\" data-name=\"hourAsc\">\n");
      out.write("                            <input class=\"w-input textfield l\" id=\"minAsc\" type=\"number\" placeholder=\"mm\" name=\"minAsc\" required=\"required\" data-name=\"minAsc\">\n");
      out.write("                            <input class=\"w-input textfield l\" id=\"secAsc\" type=\"number\" placeholder=\"ss\" name=\"secAsc\" required=\"required\" data-name=\"secAsc\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"w-clearfix middiv\">\n");
      out.write("                            <label class=\"l1\" for=\"ra-2\">Image</label>\n");
      out.write("                            <label class=\"l1\" for=\"ra-2\">Filter</label>\n");
      out.write("                            <label class=\"l1 llong\" for=\"field\">Exposure</label>\n");
      out.write("                            <div class=\"nums\">\n");
      out.write("                                <label class=\"filter-number\" for=\"None-4\">1</label>\n");
      out.write("                                <label class=\"filter-number\" for=\"None-4\">2</label>\n");
      out.write("                                <label class=\"filter-number\" for=\"None\">3</label>\n");
      out.write("                                <label class=\"filter-number\" for=\"None-4\">4</label>\n");
      out.write("                                <label class=\"filter-number\" for=\"None-4\">5</label>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"exp-div\">\n");
      out.write("                                <select class=\"w-select selectfilter\" id=\"p\" name=\"p1\" data-name=\"p1\">\n");
      out.write("                                    <option value=\"None\">None</option>\n");
      out.write("                                    <option value=\"U\">U</option>\n");
      out.write("                                    <option value=\"B\">B</option>\n");
      out.write("                                    <option value=\"V\">V</option>\n");
      out.write("                                    <option value=\"R\">R</option>\n");
      out.write("                                </select>\n");
      out.write("                                <select class=\"w-select selectfilter\" id=\"p-2\" name=\"p2\" data-name=\"p2\">\n");
      out.write("                                    <option value=\"None\">None</option>\n");
      out.write("                                    <option value=\"U\">U</option>\n");
      out.write("                                    <option value=\"B\">B</option>\n");
      out.write("                                    <option value=\"V\">V</option>\n");
      out.write("                                    <option value=\"R\">R</option>\n");
      out.write("                                </select>\n");
      out.write("                                <select class=\"w-select selectfilter\" id=\"p-3\" name=\"p3\" data-name=\"p3\">\n");
      out.write("                                    <option value=\"None\">None</option>\n");
      out.write("                                    <option value=\"U\">U</option>\n");
      out.write("                                    <option value=\"B\">B</option>\n");
      out.write("                                    <option value=\"V\">V</option>\n");
      out.write("                                    <option value=\"R\">R</option>\n");
      out.write("                                </select>\n");
      out.write("                                <select class=\"w-select selectfilter\" id=\"p-4\" name=\"p4\" data-name=\"p4\">\n");
      out.write("                                    <option value=\"None\">None</option>\n");
      out.write("                                    <option value=\"U\">U</option>\n");
      out.write("                                    <option value=\"B\">B</option>\n");
      out.write("                                    <option value=\"R\">R</option>\n");
      out.write("                                    <option value=\"V\">V</option>\n");
      out.write("                                </select>\n");
      out.write("                                <select class=\"w-select selectfilter\" id=\"p-5\" name=\"p5\" data-name=\"p5\">\n");
      out.write("                                    <option value=\"None\">None</option>\n");
      out.write("                                    <option value=\"U\">U</option>\n");
      out.write("                                    <option value=\"B\">B</option>\n");
      out.write("                                    <option value=\"R\">R</option>\n");
      out.write("                                    <option value=\"V\">V</option>\n");
      out.write("                                </select>\n");
      out.write("                            </div>\n");
      out.write("                            <input class=\"w-input et11\" id=\"et\"  type=\"number\" placeholder=\"ex. 500\" name=\"et1\" data-name=\"et1\">\n");
      out.write("                            <input class=\"w-input et11\" id=\"et-2\" type=\"number\" name=\"et2\"  data-name=\"et2\">\n");
      out.write("                            <input class=\"w-input et11\" id=\"et-3\" type=\"number\" name=\"et3\"  data-name=\"et3\">\n");
      out.write("                            <input class=\"w-input et11\" id=\"et-4\" type=\"number\" name=\"et4\" data-name=\"et4\">\n");
      out.write("                            <input class=\"w-input et11\" id=\"et-5\" type=\"number\" name=\"et5\" data-name=\"et5\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"w-clearfix titlediv\"><label class=\"kk\" for=\"count\">Count:&nbsp;</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"count\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"count\" name=\"count\">\n");
      out.write("                            <label class=\"kk\" for=\"angle\">Angle:&nbsp;</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"angle\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"angle\" name=\"angle\">\n");
      out.write("                            <label class=\"kk\" for=\"target-2\">Target:&nbsp;</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"target-2\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"target\" name=\"target\">\n");
      out.write("                            <label class=\"kk\" for=\"repeat\">Repeat:&nbsp;</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"repeat\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"repeat\" name=\"repeat\">\n");
      out.write("                            <label class=\"kk\" for=\"frame-3\">Frame:&nbsp;</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"frame-3\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"frame\" name=\"frame\">\n");
      out.write("                            <label class=\"kk\" for=\"binning\">Binning:</label>\n");
      out.write("                            <input class=\"w-input gg\" id=\"binning\" type=\"number\" placeholder=\"#\" required=\"required\" data-name=\"binning\" name=\"binning\">\n");
      out.write("                        </div>\n");
      out.write("                        <input class=\"w-button but\" type=\"submit\" value=\"Submit\" data-wait=\"Please wait...\">\n");
      out.write("                    </form>\n");
      out.write("                    <div class=\"w-form-done\">\n");
      out.write("                        <p>Thank you! Your submission has been received!</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"w-form-fail\">\n");
      out.write("                        <p>Oops! Something went wrong while submitting the form :(</p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <footer class=\"w-section section footer\">\n");
      out.write("            <div class=\"w-container\">\n");
      out.write("                <div class=\"w-row\">\n");
      out.write("                    <div class=\"w-col w-col-6\">\n");
      out.write("                        <div class=\"footer-text\">Prime Ascension</div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"w-col w-col-6 right-footer-col\"><img src=\"images/siue.png\" width=\"125\" alt=\"siue\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("        <script type=\"text/javascript\" src=\"//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
