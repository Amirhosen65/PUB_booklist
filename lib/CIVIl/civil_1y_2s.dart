import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_1y_2s extends StatefulWidget {
  const civil_1y_2s({Key? key}) : super(key: key);

  @override
  State<civil_1y_2s> createState() => _civil_1y_2sState();
}

final List<List<String>> tableData = [
  ['CE-1201', 'Surveying'],
  ['EEE-1201', 'Basic Electrical Technology'],
  ['PHY-1201', 'Physics-I'],
  ['MTH-1201', 'Mathematics-II'],
  ['BAN-1201', 'Functional Bengali Language'],
  ['HUM-1201', 'Bangladesh Studies and History of Independece'],
  ['CE-1200', 'Civil Engineering Drawing-II'],
  ['CE-1202', 'Practical Surveying'],
  ['PHY-1202', 'Physical Sessional'],


];



final List<String> pdfUrls = [
  "https://tnigatu.files.wordpress.com/2012/04/surveying-chandra1.pdf",
  "https://cbseacademic.nic.in/web_material/Curriculum/Vocational/2018/Basic_Electronics_XI.pdf",
  "https://elearn.daffodilvarsity.edu.bd/pluginfile.php/987150/mod_label/intro/fundamentals-of-physics-textbook.pdf",
  "https://amsslive.files.wordpress.com/2018/07/engineering-mathematics-ii-2009-cuppy.pdf",
  "nai",
  "https://qualifications.pearson.com/content/dam/pdf/International%20GCSE/Bangladesh%20Studies/2017/specification-and-sample-assessments/international-gcse-Bangladesh_Studies_Specification.pdf",
  "https://www.researchgate.net/publication/337868652_Engineering_Drawing_II_for_Diploma_in_Engineering",
  "https://ia801403.us.archive.org/7/items/in.ernet.dli.2015.536031/2015.536031.practical-surveying.pdf",
  "https://www.studocu.com/en-ca/course/the-university-of-western-ontario/introduction-to-physics-1/5130244",

];

class _civil_1y_2sState extends State<civil_1y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 1st Year 2nd Semester Book"),
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