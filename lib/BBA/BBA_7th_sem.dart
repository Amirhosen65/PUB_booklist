import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_7th_SEM extends StatefulWidget {
  const BBA_7th_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_7th_SEM> createState() => _BBA_7th_SEMState();
}

final List<List<String>> tableData = [
  ['EEE-451', 'VLSI I'],
  ['EEE-400', 'Thesis'],
  ['EEE-401', 'Professional Orientation'],
  ['EEE-419', 'Renamable Energy Technology'],
  ['EEE-423', 'Microwave Engineering'],
  ['EEE-424', 'Microwave Engineering  Lab'],
  ['EEE-427', 'Microwave and Embedded System Design'],

];

final List<String> pdfUrls = [
  "http://fa.ee.sut.ac.ir/Downloads/AcademicStaff/24/Courses/11/CMOS%20VLSI%20Design%20A%20Circuits%20and%20Systems%20Perspective,%204th%20Edition%20(2011).pdf",
  "https://www.perlego.com/book/992738/orientation-to-professional-counseling-past-present-and-future-trends-pdf",
  "http://site.iugaza.edu.ps/wp-content/uploads/00%20Renewable%20Energy%20book.pdf",
  "http://mwl.diet.uniroma1.it/people/pisa/RFELSYS/MATERIALE%20INTEGRATIVO/BOOKS/Pozar_Microwave%20Engineering(2012).pdf",
  "https://ece.anits.edu.in/labmanuals/mwe%20lab%20manual.pdf",
  "https://www.azdocuments.in/2020/01/microcontroller-and-embedded-systems.html?m=1",
  "https://drive.google.com/file/d/1i4Ux-VEJm4vHgmey9w49p-nnMabQz2SN/view",
  "https://ptolemy.berkeley.edu/books/leeseshia/releases/LeeSeshia_DigitalV2_2.pdf",


];

class _BBA_7th_SEMState extends State<BBA_7th_SEM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA 7th Semester Book"),
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
                              builder: (context) => bba_1ye_2se(pdfUrl: pdfUrls[i]),
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



class bba_1ye_2se extends StatelessWidget {
  final String pdfUrl;

  const bba_1ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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