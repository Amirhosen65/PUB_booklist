import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_2nd_SEM extends StatefulWidget {
  const BBA_2nd_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_2nd_SEM> createState() => _BBA_2nd_SEMState();
}

final List<List<String>> tableData = [
  ['BBA ', 'Macroeconomic'],
  ['BBA ', 'Principles of Accounting'],
  ['BBA ', 'Principles of Finance'],
  ['BBA ', 'Business Math'],
  ['BBA ', 'Principles of Marketing'],
  ['BBA ', 'Advances English'],

];

final List<String> pdfUrls = [
  "https://jollygreengeneral.typepad.com/files/n.-gregory-mankiw-macroeconomics-7th-edition-2009.pdf",
  "https://www.mccc.edu/~horowitk/documents/Chapter01_002.pdf",
  "https://www.opentextbooks.org.hk/system/files/export/12/12158/pdf/Principles_of_Finance_12158.pdf",
  "http://www.mim.ac.mw/books/Business%20mathematics%20and%20statistics,%206th%20ed.pdf",
  "https://opac.atmaluhur.ac.id/uploaded_files/temporary/DigitalCollection/ODljY2E4ODIyODViZjFkODgzNDUxYWZlNWFhZmY2MGE5MDc0ZDVmYw==.pdf",
  "http://144.122.235.170/ckfinder/userfiles/files/Advanced%20Grammar%20in%20Use%202nd%20Edition.pdf",
];

class _BBA_2nd_SEMState extends State<BBA_2nd_SEM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA 2nd Semester Book"),
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