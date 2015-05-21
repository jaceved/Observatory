package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class CreateFile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    if(null == session.getAttribute("email")){
  // User is not logged in.
        response.sendRedirect("../user/login.jsp");
    }
    
    if (!response.isCommitted()){
    if(session.getAttribute("adminPermission") != "yes")
    {
        response.sendRedirect("../user/home.jsp");
    }
    }
    
    
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("\n");
      out.write("        <title>Observatory Scheduler</title>\n");
      out.write("        <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\">\n");
      out.write("        <!-- Latest compiled and minified CSS -->\n");
      out.write("        <link rel=\"stylesheet\"  type=\"text/css\" href=\"../css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- jQuery library -->\n");
      out.write("        <script src=\"../jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Latest compiled JavaScript -->\n");
      out.write("        <script src=\"../js/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"../css/style2.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            WebFont.load({\n");
      out.write("                google: {\n");
      out.write("                    families: [\"Montserrat:400,700\", \"Varela Round:400\", \"Ubuntu:300,300italic,400,400italic,500,500italic,700,700italic\", \"Varela:400\"]\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <header class=\"w-section nav-bar\">\n");
      out.write("            <div class=\"w-container\">\n");
      out.write("                <div class=\"w-row\">\n");
      out.write("                    <div class=\"w-col w-col-4 w-clearfix brand-column\">\n");
      out.write("                        <img alt=\"54de3a4c1db7daaf1eb3843f_logo.png\" class=\"logo\"\n");
      out.write("                             src=\n");
      out.write("                             \"../images/logo.png\"\n");
      out.write("                             width=\"60\">\n");
      out.write("\n");
      out.write("                        <div class=\"company\">\n");
      out.write("                            Observatory Scheduler\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <nav class=\"w-col w-col-8 nav-column\">\n");
      out.write("                        \n");
      out.write("                        <a class=\"nav-link\" href=\"../user/home.jsp\">User Home</a>\n");
      out.write("                        <a class=\"nav-link\" href=\"../user/proposal.jsp\">Create Proposal</a>\n");
      out.write("                        <a class=\"nav-link\" href=\"../processors/processLogOut.jsp\">Logout</a>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <div class=\"w-section section hero\">\n");
      out.write("            <div class=\"w-container c1\">\n");
      out.write("                <h1 class=\"hero-heading\">Generate XML Files for Telescope</h1>\n");
      out.write("\n");
      out.write("                <p class=\"hero-subhead\">\n");
      out.write("                    Click the below button to generate the collected proposal times\n");
      out.write("                    from all students! Please specify a start time from now to begin \n");
      out.write("                    observation.\n");
      out.write("                    <br>\n");
      out.write("                    (Hours or Minutes).\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"w-section section grey\" id=\"features\">\n");
      out.write("            <div class=\"requestblock\">\n");
      out.write("                <div class=\"w-form\">\n");
      out.write("                    <div class=\"w-clearfix requestform\" data-name=\"Email Form\">\n");
      out.write("\n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("\n");
      out.write("                        <form action=\"CreateXML.jsp\" method=\"POST\" >\n");
      out.write("                        <h3> <label >Hours (From Now)</label> \n");
      out.write("                            <input type=\"text\" style=\"width: 50px; text-align: center;\" placeholder=\"HH\" name=\"hrs\">\n");
      out.write("\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <label > Minutes (From Now) </label>\n");
      out.write("                            <input type=\"text\" style=\"width: 50px; text-align: center\" placeholder=\"MM\"  name=\"mins\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            \n");
      out.write("                            <input type=\"submit\" value=\"Generate\" class=\"btn btn-success\">\n");
      out.write("                        </h3>\n");
      out.write("                       </form>\n");
      out.write("\n");
      out.write("                    </div >\n");
      out.write("\n");
      out.write("                </div >\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <footer class=\"w-section section footer\">\n");
      out.write("            <div class=\"w-container\">\n");
      out.write("                <div class=\"w-row\">\n");
      out.write("                    <div class=\"w-col w-col-6\">\n");
      out.write("                        <div class=\"footer-text\">\n");
      out.write("                            Prime Ascension\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"w-col w-col-6 right-footer-col\"><img alt=\n");
      out.write("                                                                     \"siue.png\" src=\n");
      out.write("                                                                     \"images/siue.png\"\n");
      out.write("                                                                     width=\"125\"></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer><script src=\n");
      out.write("                         \"//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\" type=\n");
      out.write("        \"text/javascript\"></script> \n");
      out.write("        <!--[if lte IE 9]><script src=\"//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js\"></script><![endif]-->\n");
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
