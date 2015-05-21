/*
 Document   : CreateXML
 Created on : Nov 1, 2014, 10:23:17 PM
 Modfied    : March 15, 2015
 Author     : Jaime Acevedo

 Description: Creates an XML file by reading into the observatory database 
 for specified times and parameters. After the variables have been 
 read and stored from the Scheduler Module it is written to a file and stored in a specified 
 directory. The  generated file  is eventually uploaded to the telescope 
 observatory loader for image processing.
 */
package observatory;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.jsp.JspWriter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.ProcessingInstruction;
import org.w3c.dom.Element;

/**
 *
 * @author Jaime
 */
public class CreateXML {

    JspWriter outt;

    ArrayList<Proposal> unscheduledObservationList = new ArrayList();;
    ArrayList<Proposal> scheduledObservationList = new ArrayList();;

    public String FullPath;
    public String FileName;
    FileManager dir;
    int hour;
    int min;
    
    public CreateXML(JspWriter writer,int houroffset, int minoffset) {
        outt = writer;
        hour = houroffset;
        min = minoffset;
    }

    public CreateXML() {
        hour = 5;
        min = 2;
    }

    public void Test() throws IOException {

        outt.println("Hello");
    }

    public void createFile() throws IOException {

        try {

            Scheduler ss = new Scheduler();
            ArrayList temp = ss.getTodaysProposals();
            
            unscheduledObservationList = ss.sortProposals(temp);
            
               for (Proposal temp1 : unscheduledObservationList) {
            System.out.println(temp1.toString());
                        System.out.println("XXX");

        }

            scheduledObservationList = ss.setDateandTime(unscheduledObservationList, hour, min);
            System.out.println("TIME:"+hour+":"+min);
               for (Proposal temp1 : scheduledObservationList) {
            System.out.println(temp1.toString());
        }

            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            doc.setXmlStandalone(true);
            ProcessingInstruction pi = doc.createProcessingInstruction("xml-stylesheet", "type=\"text/xsl\" href=\"my.stylesheet.xsl\"");

            Element rootElement = doc.createElement("NewDataSet");
            doc.appendChild(rootElement);

            doc.insertBefore(pi, rootElement);

            // Schema elements
            Element schema = doc.createElement("xs:schema");
            rootElement.appendChild(schema);
            schema.setAttribute("xmlns:msdata", "urn:schemas-microsoft-com:xml-m");
            schema.setAttribute("xmlns:xs", "http://www.w3.org/2001/XMLSchema");
            schema.setAttribute("xmlns", "");
            schema.setAttribute("id", "NewDataSet");

            // Element elements
            Element element = doc.createElement("xs:element");
            schema.appendChild(element);
            element.setAttribute("name", "NewDataSet");
            element.setAttribute("msdata:IsDataSet", "true");
            element.setAttribute("msdata:UseCurrentLocale", "true");

            //Element complexType
            Element complex = doc.createElement("xs:complexType");
            element.appendChild(complex);

            //Element choice
            Element choice = doc.createElement("xs:choice");
            complex.appendChild(choice);
            choice.setAttribute("minOccurs", "0");
            choice.setAttribute("maxOccurs", "unbounded");

            //Element
            element = doc.createElement("xs:element");
            choice.appendChild(element);
            element.setAttribute("name", "Table1");

            //Element Complex
            complex = doc.createElement("xs:complexType");
            element.appendChild(complex);

            //Element sequence
            Element sequence = doc.createElement("xs:sequence");
            complex.appendChild(sequence);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "STARTNAME");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "STARTTIME");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "TARGET");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "ID");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "RA");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "ANGLE");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "REPEAT");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "FRAME");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "FILTER");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "EXPOSURE");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "BINNING");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            //Element
            element = doc.createElement("xs:element");
            element.setAttribute("name", "COUNT");
            element.setAttribute("type", "xs::string");
            element.setAttribute("minOccurs", "0");
            sequence.appendChild(element);

            /// Add FOR loop
            for (Proposal newProposal : scheduledObservationList) {

                Element table = doc.createElement("Table1");
                rootElement.appendChild(table);

                Element date = doc.createElement("STARTDATE");
                date.setTextContent(newProposal.getSTART_DATE());
                table.appendChild(date);

                Element time = doc.createElement("STARTTIME");
                time.setTextContent(newProposal.getSTART_TIME());
                table.appendChild(time);

                Element target = doc.createElement("TARGET");
                target.setTextContent(newProposal.getTARGET());
                table.appendChild(target);

                Element id = doc.createElement("ID");
                id.setTextContent(newProposal.getID());
                table.appendChild(id);

                Element ra = doc.createElement("RA");
                ra.setTextContent(newProposal.getRA());
                table.appendChild(ra);

                Element dc = doc.createElement("DC");
                dc.setTextContent(newProposal.getDC());
                table.appendChild(dc);

                Element ang = doc.createElement("ANGLE");
                ang.setTextContent(newProposal.getANGLE());
                table.appendChild(ang);

                Element repeat = doc.createElement("REPEAT");
                repeat.setTextContent(newProposal.getREPEAT());
                table.appendChild(repeat);

                Element frame = doc.createElement("FRAME");
                frame.setTextContent(newProposal.getFRAME());
                table.appendChild(frame);

                Element filter = doc.createElement("FILTER");
                filter.setTextContent(newProposal.getFILTER());
                table.appendChild(filter);

                Element exposure = doc.createElement("EXPOSURE");
                exposure.setTextContent(newProposal.getEXPOSURE());
                table.appendChild(exposure);

                Element binning = doc.createElement("BINNING");
                binning.setTextContent(newProposal.getBINNING());
                table.appendChild(binning);

                Element count = doc.createElement("COUNT");
                count.setTextContent(newProposal.getCOUNT());
                table.appendChild(count);

            }
            // write the content into xml file and format nicely 
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
            DOMSource source = new DOMSource(doc);

            //Create file 
            dir = new FileManager();
            dir.makeDir();
            FileName = dir.getTimeStamp()+".xml";
            
            FullPath = dir.getTodaysPath() + "/" + FileName;

            StreamResult result = new StreamResult(FullPath);
            
            transformer.transform(source, result);
            outt.println("<h3> File saved to: " + FullPath + "</h3>");
            
            getPath();
            
        } catch (SQLException e) {
            e.printStackTrace();
            outt.println("Error SQL");
        } catch (TransformerException e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            outt.println(sw.toString());
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
            outt.println("Error Parse");
        }
    }

    public void getPath() throws IOException {
        String localPath = dir.localhostPath+"/"+FileName;
        outt.print("<br>");
        outt.print("<br>");
        outt.print(" <a class=\"btn btn-success\" href=\""+localPath+"\" download > Download </a>" );

    }
    public static void main(String[] args) throws SQLException, IOException {

        CreateXML n = new CreateXML();
        n.createFile();
    }

}
