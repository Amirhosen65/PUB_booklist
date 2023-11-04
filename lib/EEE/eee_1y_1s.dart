import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_1y_1s extends StatefulWidget {
  const eee_1y_1s({Key? key}) : super(key: key);

  @override
  State<eee_1y_1s> createState() => _eee_1y_1sState();
}

final List<List<String>> tableData = [
  ['EEE-1101', 'Electrical Circuits I'],
  ['EEE-1102', 'Electrical Circuits I Lab'],
  ['CSE-1101', 'Computer Programming'],
  ['CSE-1102', 'Computer Programming Lab'],
  ['CE-1102', 'Engineering Drawing and CAD Lab'],
  ['MTH-1101', 'Differential and Intefral Calculus and Matrices'],
  ['PHY-1101', 'Physics I'],
  ['ENG-1101', 'Technical and Communication English'],
  ['HUM-1101', 'Bangladesh Studies and History of Independence'],


];

final List<String> pdfUrls = [
  "https://bank.engzenon.com/download/5bf85097-f60c-4c96-b1cc-4230c0feb99b/Fundamentals_of_Electric_Circuits_6th_Sadiku.pdf",
  "https://ssl.du.ac.bd/fontView/images/syllabus/1647053540EEEsyllabusold.pdf",
  "https://www.pearsonhighered.com/assets/samplechapter/0/3/2/1/0321537114.pdf",
  "http://aleteya.cs.buap.mx/~jlavalle/papers/books_on_line/MIT.Press.Concepts.Techniques.and.Models.of.Computer.Programming.eBook-DDU.pdf",
  "https://ia800107.us.archive.org/18/items/TextbookOfEngineeringDrawing_201802/Textbook%20of%20Engineering%20Drawing.pdf",
  "https://mirtitles.org/2022/05/29/differential-and-integral-calculus-volumes-1-2-piskunov/",
  "https://elearn.daffodilvarsity.edu.bd/pluginfile.php/987150/mod_label/intro/fundamentals-of-physics-textbook.pdf",
  "https://www.himpub.com/documents/Chapter3267.pdf",
  "https://qualifications.pearson.com/content/dam/pdf/International%20GCSE/Bangladesh%20Studies/2017/specification-and-sample-assessments/international-gcse-Bangladesh_Studies_Specification.pdf",

];

class _eee_1y_1sState extends State<eee_1y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 1st Year 1st Semester Book"),
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
                              builder: (context) => eee_1ye_1se(pdfUrl: pdfUrls[i]),
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


class eee_1ye_1se extends StatelessWidget {
  final String pdfUrl;

  const eee_1ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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