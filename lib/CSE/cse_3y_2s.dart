import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_3y_2s extends StatefulWidget {
  const cse_3y_2s({Key? key}) : super(key: key);

  @override
  State<cse_3y_2s> createState() => _cse_3y_2sState();
}

final List<List<String>> tableData = [
  ['CSE-323', 'Microprocessors and Assembly Language Programming'],
  ['CSE-324', 'Microprocessors and Assembly Language Programming Lab'],
  ['CSE-335', 'Computer Design'],
  ['CSE-336', 'Computer Design Lab'],
  ['CSE-333', 'Computer Networking'],
  ['CSE-334', 'Computer Networking Lab'],
  ['CSE-325', 'System Analysis and Design'],
  ['MAT-211', 'Co-ordinate Geometry and Vector Analysis'],
  ['BNA-311', 'Principles of Business and Accounting'],

];

final List<String> pdfUrls = [
  "https://www.cin.ufpe.br/~clac/infra_de_software/Introduction%20to%20Assembly%20Language%20Programming~tqw~_darksiderg.pdf",
  "https://gnindia.dronacharya.info/ECE/Downloads/Labmanuals/Microprocessor_Lab_Manual.pdf",
  "https://archive.org/download/DigitalLogicAndComputerDesignByM.MorrisMano2ndEdition/Digital%20Logic%20And%20Computer%20Design%20By%20M.%20Morris%20Mano%20%282nd%20Edition%29.pdf",
  "https://www.researchgate.net/publication/345098489_Design_and_Implement_a_Smart_Computer_Lab_for_Exam_and_e-Learning_Issue",
  "https://textbookequity.org/Textbooks/Computer-Networking-Principles-Bonaventure_f.pdf",
  "https://sjce.ac.in/wp-content/uploads/2018/01/CCNA-lab-Manual.pdf",
  "http://www.uoitc.edu.iq/images/documents/informatics-institute/Competitive_exam/Systemanalysisanddesign.pdf",
  "https://cds.cern.ch/record/1596989/files/978-1-4614-7825-6_BookBackMatter.pdf",
  "https://www.freebookcentre.net/business-books-download/Principles-of-Accounting.html",


];

class _cse_3y_2sState extends State<cse_3y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 3rd Year 1st Semester Book"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FlexColumnWidth(2.3),
              1: FlexColumnWidth(6),
              2: FlexColumnWidth(1.3),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Course Code',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Course Title',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PDF',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < tableData.length; i++)
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(tableData[i][0], style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    TableCell(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cse_3ye_2se(pdfUrl: pdfUrls[i]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(tableData[i][1], style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.download),
                          onPressed: () {
                            launch(pdfUrls[i]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),

        ),
      ),

    );
  }
}



class cse_3ye_2se extends StatelessWidget {
  final String pdfUrl;

  const cse_3ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("PDF View"),
        ),
        body:
        // link fron internet
        SfPdfViewer.network(pdfUrl)
      // SfPdfViewer.asset("asset/proposal.pdf"),
    );
  }
}