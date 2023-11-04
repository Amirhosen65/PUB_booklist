import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_2y_1s extends StatefulWidget {
  const eee_2y_1s({Key? key}) : super(key: key);

  @override
  State<eee_2y_1s> createState() => _eee_2y_1sState();
}

final List<List<String>> tableData = [
  ['EEE-2103', 'Electrical Circuits II'],
  ['EEE-2104', 'Electrical Circuits I Lab'],
  ['EEE-2105', 'Electrical Machines I'],
  ['ME-2101', 'Fundamental and mechanical engineering'],
  ['CHM-2101', 'Chemistry'],
  ['CHM-2102', 'Chemistry Lab'],
  ['MTH-2101', 'Linear Algebra,Vector Analysis and Co-ordinate Germetry'],
  ['BUS-2102', 'Financial,Cost and Managerial Accounting'],
  ['SS-2101', 'Engineering Economics'],


];

final List<String> pdfUrls = [
  "https://batch.libretexts.org/print/Letter/Finished/workforce-1376/Full.pdf",
  "https://www2.mvcc.edu/users/faculty/jfiore/Circuits2/labs/LaboratoryManualforACElectricalCircuits.pdf",
  "https://referenceglobe.com/CollegeLibrary/library_books/20200125041045198204Electrical%20Machines%20by%20Mr.%20S.%20K.%20Sahdev.pdf",
  "https://industri.fatek.unpatti.ac.id/wp-content/uploads/2019/03/077-Mechanical-Engineering-Principles-John-Bird-Carl-Ross-Edisi-3-2015.pdf",
  "http://dl.iranchembook.ir/ebook/General-Chemistry-600.pdf",
  "https://www.fandm.edu/uploads/files/79645701812579729-genchem-reference-for-web.pdf",
  "http://students.aiu.edu/submissions/profiles/resources/onlineBook/C9M2d6_Linear_Algebra_and_Matrix_Analysis_for_Statistics.pdf",
  "https://www.drnishikantjha.com/booksCollection/Textbook%20of%20Financial%20Cost%20and%20Management%20Accounting%20(%20PDFDrive%20)%20(1).pdf",
  "https://www.hzu.edu.in/engineering/engineering%20economy.pdf",

];


class _eee_2y_1sState extends State<eee_2y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 2nd Year 1st Semester Book"),
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
                              builder: (context) => eee_2ye_1se(pdfUrl: pdfUrls[i]),
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



class eee_2ye_1se extends StatelessWidget {
  final String pdfUrl;

  const eee_2ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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