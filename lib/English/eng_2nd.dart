import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eng_2nd extends StatefulWidget {
  const eng_2nd({Key? key}) : super(key: key);

  @override
  State<eng_2nd> createState() => _eng_2ndState();
}

final List<List<String>> tableData = [
  ['221101', 'Introduction to Drama'],
  ['221103', 'Romantic Poetry'],
  ['221105', 'Advanced Reading and Writing'],
  ['221107', 'History of English Literature'],
  ['222009', 'Sociology of Bangladesh Or'],
  ['222115', 'Bangladesh Society and Culture'],
  ['221909', 'Political Organization and The Political System of UK and USA'],


];

final List<String> pdfUrls = [
  "https://www.researchgate.net/publication/344599996_An_Introduction_to_Drama",
  "https://uomustansiriyah.edu.iq/media/lectures/12/12_2020_02_27!03_00_00_PM.pdf",
  "http://salimrazi.com/userfiles/Week_2_ARAW1_Introduction_to_Academic_Writing.pdf",
  "https://archive.org/download/historyofenglish00comp/historyofenglish00comp.pdf",
  "https://www.researchgate.net/publication/327262361_Introductory_Sociology_of_Bangladesh",
  "http://www.ebookbou.edu.bd/Books/Text/SSHL/BABSS/bso_4303/Inner.pdf",
  "https://lac.unfpa.org/sites/default/files/pub-pdf/Political%20Analysis%20and%20Mapping%20web%20version.pdf",



];

class _eng_2ndState extends State<eng_2nd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English 2nd Year Book List"),
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
                              builder: (context) => eng_2ye(pdfUrl: pdfUrls[i]),
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


class eng_2ye extends StatelessWidget {
  final String pdfUrl;

  const eng_2ye({Key? key, required this.pdfUrl}) : super(key: key);

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