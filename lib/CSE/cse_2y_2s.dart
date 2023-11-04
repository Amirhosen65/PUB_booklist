import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_2y_2s extends StatefulWidget {
  const cse_2y_2s({Key? key}) : super(key: key);

  @override
  State<cse_2y_2s> createState() => _cse_2y_2sState();
}

final List<List<String>> tableData = [
  ['CSE-223', 'Digital Logic Design'],
  ['CSE-224', 'Digital Logic Design Lab'],
  ['CSE-213', 'Electronics'],
  ['CSE-214', 'Electronics Lab'],
  ['CSE-311', 'Database Management System'],
  ['CSE-312', 'Database Management System Lab'],
  ['CSE-235', 'Design and Analysis of Algorithm'],
  ['CSE-236', 'Design and Analysis of Algorithm Lab'],
  ['MAT-221', 'Complex Variable and Transform Mathematics'],
  ['STA-221', 'Probability and Statics'],


];

final List<String> pdfUrls = [
  "https://www.portcity.edu.bd/files/636444791235373856_Digitallogicdesign.pdf",
  "https://gnindia.dronacharya.info/CSE/Downloads/Labmanuals/LogicDesign_Lab_CSE-III.pdf",
  "https://drive.google.com/file/d/1nBTtLZ5GlbBg5gJ88OXHZ5spplT1d_vu/view?usp=sharing",
  "https://mjcollege.ac.in/images/labmannuals/BasicElectroniclabmanualBIT231.pdf",
  "https://xuanhien.files.wordpress.com/2011/04/database-management-systems-raghu-ramakrishnan.pdf",
  "https://mrcet.com/pdf/Lab%20Manuals/CSE%20II-II%20SEM.pdf",
  "https://mrcet.com/downloads/digital_notes/IT/Design%20and%20Analysis%20Algorithms.pdf",
  "https://fmipa.umri.ac.id/wp-content/uploads/2016/03/Klaus_Hinkelmann_Oscar_Kempthorne_Design_and_AnBookFi.org_.pdf",
  "https://g.co/kgs/jSVRY3",
  "https://fac.ksu.edu.sa/sites/default/files/probability_and_statistics_for_engineering_and_the_sciences.pdf",

];

class _cse_2y_2sState extends State<cse_2y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 2nd Year 2nd Semester Book"),
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
                              builder: (context) => csebook_2_2s(pdfUrl: pdfUrls[i]),
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




class csebook_2_2s extends StatelessWidget {
  final String pdfUrl;

  const csebook_2_2s({Key? key, required this.pdfUrl}) : super(key: key);

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