import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_1y_1s extends StatefulWidget {
  const civil_1y_1s({Key? key}) : super(key: key);

  @override
  State<civil_1y_1s> createState() => _civil_1y_1sState();
}

final List<List<String>> tableData = [
  ['CE-1101', 'Analytic Mechanics'],
  ['CHM-1101', 'Chemistry'],
  ['ENG-1101', 'Technical and Communicative English'],
  ['MTH-1101', 'Mathematics-I'],
  ['PHY-1101', 'Physics-I'],
  ['CE-1100', 'Civil Engineering Drawing-I'],
  ['CHM-1102', 'Chemistry Sessional'],
  ['ENG-1102', 'Developing English Skills Sessional'],


];



final List<String> pdfUrls = [
  "https://library.uoh.edu.iq/admin/ebooks/72890-nivaldo-a.-lemos---analytical-mechanics-(2018,-cambridge-university-press)---libgen.lc.pdf",
  "http://dl.iranchembook.ir/ebook/General-Chemistry-600.pdf",
  "https://www.himpub.com/documents/Chapter3267.pdf",
  "http://menso88.weebly.com/uploads/1/7/5/8/17586891/textbook_og_engineering_matematics.pdf",
  "https://elearn.daffodilvarsity.edu.bd/pluginfile.php/987150/mod_label/intro/fundamentals-of-physics-textbook.pdf",
  "https://www.researchgate.net/publication/369991603_Intro_to_Civil_Engineering_Drawing_Textbook_-_Pre_Chapters",
  "https://www.fandm.edu/uploads/files/79645701812579729-genchem-reference-for-web.pdf",
  "https://www.geethanjaliinstitutions.com/engineering/labmanuals/downloads/cse/aecs%20lab.pdf",

];

class _civil_1y_1sState extends State<civil_1y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CIVIL 1st Year 1st Semester Book"),
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
                              builder: (context) => civil_1ye_1se(pdfUrl: pdfUrls[i]),
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


class civil_1ye_1se extends StatelessWidget {
  final String pdfUrl;

  const civil_1ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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