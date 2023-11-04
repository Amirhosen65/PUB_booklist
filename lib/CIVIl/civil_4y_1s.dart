import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_4y_1s extends StatefulWidget {
  const civil_4y_1s({Key? key}) : super(key: key);

  @override
  State<civil_4y_1s> createState() => _civil_4y_1sState();
}

final List<List<String>> tableData = [
  ['CE-403', 'Business and Carrier Development'],
  ['CE-411', 'Structure Analysis-II'],
  ['CE-331', 'Foundation Engineering'],
  ['CE-343', 'Highway Pavement Design and Railways'],
  ['CE-353', 'Hydrology, Imigation and Flood Management'],
  ['CE-316', 'Design of Concrete Structure Sessional-II'],
  ['CE-344', 'Transportation Engineering Sessional'],
  ['HUM-401', 'Professional Ethics'],
  ['ENG-102', 'Developing English Skills Sessional'],


];

final List<String> pdfUrls = [
  "https://business.fiu.edu/careers/students/pdf/A-Career-Services-Guide-to-Business-Success.pdf",
  "https://www.scribd.com/document/429754716/Structural-Analysis-II-4th-Edition-by-SS-Bhabhikatti-pdf",
  "http://faculty.tafreshu.ac.ir/file/download/course/1583679470-foundation-engineering-handbook.pdf",
  "https://gacbe.ac.in/images/E%20books/Highway%20Engineering%20Handbook%203rd%20Editionbb.pdf",
  "https://wecivilengineers.files.wordpress.com/2017/10/applied-hydrology-ven-te-chow.pdf",
  "https://docplayer.net/amp/54787653-Ce-316-design-of-concrete-structures-sessional-lab-manual.html",
  "https://www.aust.edu/lab_manuals/CE/ce_354.pdf",
  "https://www.academia.edu/39689773/Professional_Ethics_and_Human_Values_by_R_S_NAAGARAZAN",
  "https://bayanebartar.org/file-dl/library/IELTS10/EAP-English-for-Academic-Study-Speaking/English-for-Academic-Study-Speaking-SB.pdf",

];

class _civil_4y_1sState extends State<civil_4y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 4th Year 1st Semester Book"),
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
                              builder: (context) => civil_4ye_1se(pdfUrl: pdfUrls[i]),
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


class civil_4ye_1se extends StatelessWidget {
  final String pdfUrl;

  const civil_4ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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