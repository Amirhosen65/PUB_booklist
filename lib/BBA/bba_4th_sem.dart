import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_4th_SEM extends StatefulWidget {
  const BBA_4th_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_4th_SEM> createState() => _BBA_4th_SEMState();
}

final List<List<String>> tableData = [
  ['BBA ', 'Financial Management'],
  ['BBA ', 'Business Communication'],
  ['BBA ', 'Principles of Commercial Law'],
  ['BBA ', 'Intermediate Accounting'],
  ['BBA ', 'Business-Statistics'],
  ['BBA ', 'Macroeconomics '],
  ['BBA ', 'Information System'],
  ['BBA ', 'SM Strategic Management'],

];

final List<String> pdfUrls = [
  "https://www.ascdegreecollege.ac.in/wp-content/uploads/2020/12/Financial-Management-Text-Cum-Suggested-Answers-by-Rama-Gopal.pdf",
  "https://dcomm.org/wp-content/uploads/2019/05/Business-Communication-PDFDrive.com-.pdf",
  "https://books-library.net/files/books-library.online-02051847Oy4L7.pdf",
  "https://www.stie-66.ac.id/wp-content/uploads/2022/10/Intermediate-Accounting-IFRS-4th-Edition-by-Donald-E.-Kieso-by-Donald-E.-Kieso-Jerry-J.-Weygandt-Terry-D.-Warfield-z-lib.org_.pdf",
  "https://www.ascdegreecollege.ac.in/wp-content/uploads/2020/12/Business-Statistics-by-Gupta.pdf",
  "https://home.ufam.edu.br/andersonlfc/MacroI/Livro%20Macro.pdf",
  "nai",
  "nai",

];

class _BBA_4th_SEMState extends State<BBA_4th_SEM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA 5th Semester Book"),
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
                              builder: (context) => bba_4ye_1se(pdfUrl: pdfUrls[i]),
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


class bba_4ye_1se extends StatelessWidget {
  final String pdfUrl;

  const bba_4ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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