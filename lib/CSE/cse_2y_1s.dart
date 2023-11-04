import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_2y_1s extends StatefulWidget {
  const cse_2y_1s({Key? key}) : super(key: key);

  @override
  State<cse_2y_1s> createState() => _cse_2y_1sState();
}

final List<List<String>> tableData = [
  ['CSE-211', 'Data Structure'],
  ['CSE-212', 'Data Structure Lab'],
  ['CSE-133', 'Circuit Analysis'],
  ['CSE-134', 'Circuit Analysis Lab'],
  ['CSE-221', 'Object Oriented Programming II(Java)'],
  ['CSE-222', 'Object Oriented Programming Lab II (Java)'],
  ['CSE-321', 'Numerical Methods'],
  ['MAT-131', 'Linear Algebra and Matrix Analysis'],


];


final List<String> pdfUrls = [
  "https://everythingcomputerscience.com/books/schoolboek-data_structures_and_algorithms_in_java.pdf",
  "https://mrcet.com/pdf/Lab%20Manuals/CSE/(R18A0584)%20Data%20Structures%20Lab%20Manual.pdf",
  "https://faculty.ksu.edu.sa/sites/default/files/introductorycircuitanalysis10thedition.pdf",
  "https://mrcet.com/downloads/Labmanuals/EEE/ELECTRICAL%20CIRCUITS%20LAB.pdf",
  "https://books-library.net/files/download-pdf-ebooks.org-1494095049Ne2H5.pdf",
  "https://jadoon956.files.wordpress.com/2020/12/oop-lab-manual-java-by-rab-nawaz-jadoon.pdf",
  "https://gdcboysang.ac.in/About/Droid/uploads/Numerical%20Methods.pdf",
  "http://students.aiu.edu/submissions/profiles/resources/onlineBook/C9M2d6_Linear_Algebra_and_Matrix_Analysis_for_Statistics.pdf",

];

class _cse_2y_1sState extends State<cse_2y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 2nd Year 1st Semester Book"),
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
                              builder: (context) => cse_2ye_1se(pdfUrl: pdfUrls[i]),
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



class cse_2ye_1se extends StatelessWidget {
  final String pdfUrl;

  const cse_2ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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