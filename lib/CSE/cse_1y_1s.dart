
import 'package:flutter/material.dart';
import 'package:pub_booklist/CSE/cse_books/cse1y1s.dart';
import 'package:url_launcher/url_launcher.dart';

class cse_1y_1s extends StatefulWidget {
  const cse_1y_1s({Key? key}) : super(key: key);

  @override
  State<cse_1y_1s> createState() => _cse_1y_1sState();
}

final List<List<String>> tableData = [
  ['CSE-1101', 'Structured Programming Language'],
  ['CSE-1102', 'Structured Programming Language Sessional'],
  ['CSE-1103', 'Discrete Mathematics'],
  ['EEE-1101', 'Basic Electrical Engineering'],
  ['EEE-1102', 'Basic Electrical Engineering Sessional'],
  ['MTH-1101', 'Differential and Integral Calculus and Matrices'],
  ['PHY-1101', 'Physics-I'],
  ['ENG-1101', 'Technical and Communicative English'],
  ['CE-1102', 'Engineering Drawing and CAD Sessional'],
];

final List<String> pdfUrls = [
  "https://mycsvtunotes.weebly.com/uploads/1/0/1/7/10174835/computer_fundamental_complete-i.pdf",
  "https://www.academia.edu/36581929/LAB_Manual_of_Computer_Fundamentals",
  "https://www2.cs.uh.edu/~arjun/courses/ds/DiscMaths4CompSc.pdf",
  "https://www.opentextbooks.org.hk/system/files/export/9/9648/pdf/Fundamentals_of_Electrical_Engineering_I_9648.pdf",
  "https://www.aust.edu/lab_manuals/MPE/ME/me_eee_1288.pdf",
  "https://www.academia.edu/38408519/mat_121_linear_algebra_theory_of_matrices_by_professor_md_abdur_rahman_pdf",
  "https://elearn.daffodilvarsity.edu.bd/pluginfile.php/987150/mod_label/intro/fundamentals-of-physics-textbook.pdf",
  "https://demo.aiub.edu/eng-1101",
  "https://www.aust.edu/lab_manuals/CE/ce_100.pdf"

];

class _cse_1y_1sState extends State<cse_1y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 1st Year 1st Semester Book"),
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
                              builder: (context) => PDFViewerPage(pdfUrl: pdfUrls[i]),
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
