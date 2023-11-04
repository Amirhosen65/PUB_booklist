import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_5th_SEM extends StatefulWidget {
  const BBA_5th_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_5th_SEM> createState() => _BBA_5th_SEMState();
}

final List<List<String>> tableData = [
  ['BBA ', 'Audit and Taxation'],
  ['BBA ', 'Entrepreneurship'],
  ['BBA ', 'Small Business'],
  ['BBA ', 'Project Management'],
  ['BBA ', 'Resources Methodologies'],
  ['BBA ', 'MIS Management'],
  ['BBA ', 'Information System'],
  ['BBA ', 'SM Strategic Management'],

];

final List<String> pdfUrls = [
  "http://www.dacc.edu.in/wp-content/uploads/2020/08/PPT-TY-B.COM-304-AUDITING-TAXATION.pdf",
  "https://ebooks.lpude.in/commerce/bcom/term_5/DCOM305_DMGT310_ENTREPRENEURSHIP_AND_SMALL_BUSINESS_MANAGEMENT.pdf",
  "http://www.untag-smd.ac.id/files/Perpustakaan_Digital_1/BUSINESS%20Small%20Business%20Survival%20Book.pdf",
  "https://www.opentextbooks.org.hk/system/files/export/15/15694/pdf/Project_Management_15694.pdf",
  "https://ccsuniversity.ac.in/bridge-library/pdf/Research-Methodology-CR-Kothari.pdf",
  "http://www.mim.ac.mw/books/Management%20Information%20Systems%2010th%20Edition.pdf",
  "http://librodigital.sangregorio.edu.ec/librosusgp/06923.pdf",
  "https://www.ascdegreecollege.ac.in/wp-content/uploads/2020/12/Principles-of-Strategic-Management.pdf",

];

class _BBA_5th_SEMState extends State<BBA_5th_SEM> {
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
                              builder: (context) => bba_5ye_1se(pdfUrl: pdfUrls[i]),
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


class bba_5ye_1se extends StatelessWidget {
  final String pdfUrl;

  const bba_5ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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