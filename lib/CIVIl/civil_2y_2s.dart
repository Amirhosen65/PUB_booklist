import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_2y_2s extends StatefulWidget {
  const civil_2y_2s({Key? key}) : super(key: key);

  @override
  State<civil_2y_2s> createState() => _civil_2y_2sState();
}

final List<List<String>> tableData = [
  ['CE-301', 'Professional Practice and Communication'],
  ['CE-205', 'Applied Mathematics for Engineers'],
  ['CE-213', 'Mechanics of Solid-II'],
  ['MTH-203', 'Numerical Methods'],
  ['CE-204', 'Computer Programming Sessional'],
  ['CE-206', 'Engineering Computation Sessional'],
  ['CE-208', 'Quantity Surveying'],
  ['CE-252', 'Fluid Mechanics Sessional'],
  ['HUM-101', 'Sociology'],


];

final List<String> pdfUrls = [
  "https://www.slideshare.net/SumaiyaJabin/professional-practices-and-communication",
  "https://eduguidehome.files.wordpress.com/2019/03/applied-mathematics-by-david-logan-4th-edition.pdf",
  "http://students.aiu.edu/submissions/profiles/resources/onlineBook/Y7D6S2_010409-142737.pdf",
  "https://www.researchgate.net/profile/Abiodun_Opanuga/post/how_can_solve_a_non_linear_PDE_using_numerical_method/attachment/59d61f7279197b807797de30/AS%3A284742038638596%401444899200343/download/Numerical+Methods.pdf",
  "https://www.pearsonhighered.com/assets/samplechapter/0/3/2/1/0321537114.pdf",
  "https://ftp.idu.ac.id/wp-content/uploads/ebook/tdg/DESIGN%20SISTEM%20DAYA%20GERAK/Engineering%20Fundamentals.pdf",
  "http://quantitysurveyindia.com/QS-book.pdf",
  "https://www.aust.edu/lab_manuals/CE/ce_272.pdf",
  "https://assets.openstax.org/oscms-prodcms/media/documents/IntroductiontoSociology3e-WEB_TZsroiv.pdf",

];

class _civil_2y_2sState extends State<civil_2y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 2nd Year 2nd Semester Book"),
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
                              builder: (context) => civil_2ye_2se(pdfUrl: pdfUrls[i]),
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



class civil_2ye_2se extends StatelessWidget {
  final String pdfUrl;

  const civil_2ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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