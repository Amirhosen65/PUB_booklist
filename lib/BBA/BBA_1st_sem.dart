import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_1st_SEM extends StatefulWidget {
  const BBA_1st_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_1st_SEM> createState() => _BBA_1st_SEMState();
}

final List<List<String>> tableData = [
  ['BBA 048803', 'Bengali Language'],
  ['BBA 048801', 'Basic English'],
  ['BBA 048806', 'Bangladesh Studies'],
  ['BBA 041001', 'Introduction to Business'],
  ['BBA 041301', 'Principles of Management'],
  ['BBA 048807', 'Computer in Business'],
  ['BBA 048810', 'Computer in Business (Practical)'],

];

final List<String> pdfUrls = [
  "https://drive.google.com/file/d/1klUPe9UEXOqG-dAtqjErlhqBWiP10pzg/view?usp=sharing",
  "https://thoriyanto.files.wordpress.com/2012/11/betty_azar_-_basic_english_grammar_2nd_ed.pdf",
  "https://www.academia.edu/4462835/Bangladesh_Studies_by_Hasebur_Rahman",
  "https://d3bxy9euw4e147.cloudfront.net/oscms-qa/media/documents/IntroductionToBusiness-OP.pdf",
  "https://open.umn.edu/opentextbooks/textbooks/34",
  "https://www.himpub.com/documents/Chapter1197.pdf",
  "https://www.stet.edu.in/SSR_Report/Study%20Material/PDF/CA/UG/II%20Year/3.pdf",
];

class _BBA_1st_SEMState extends State<BBA_1st_SEM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA 1st Semester Book"),
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
                              builder: (context) => bba_1ye_1se(pdfUrl: pdfUrls[i]),
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



class bba_1ye_1se extends StatelessWidget {
  final String pdfUrl;

  const bba_1ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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