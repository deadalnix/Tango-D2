import tango.io.device.File;
import tango.io.Stdout;
import tango.text.Util;
import tango.text.xml.Document;

/******************************************************************************

  From http://www.dsource.org/projects/tango/wiki/TutXmlPath

  Free for any use, without warranty, by Sean Kerr

******************************************************************************/

void main () {
    // load our xml document
    auto file = new File("xpath.xml");
    auto xml  = new char[file.length];

    file.input.read(xml);

    // create document
    auto doc = new Document!(char);
    doc.parse(xml);

    // get the root element
    auto root = doc.elements;

    // query the doc for all country elements with an id attribute (all of them)
    auto result = root.query.descendant("country").attribute("id");

    foreach (e; result) {
        Stdout(e.value).newline;
    }
}
