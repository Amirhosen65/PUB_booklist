import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_3y_1s extends StatefulWidget {
  const civil_3y_1s({Key? key}) : super(key: key);

  @override
  State<civil_3y_1s> createState() => _civil_3y_1sState();
}

final List<List<String>> tableData = [
  ['CE-215', 'Structural Analysis-I'],
  ['CE-311', 'Design of Concrete Structures-I'],
  ['CE-313', 'Design of Steel Structures'],
  ['CE-321', 'Environmental Engineering-I'],
  ['CE-231', 'Principle of Soil Mechanics'],
  ['CE-212', 'Structural Mechanics and Materials Sessional'],
  ['CE-332', 'Soil Mechanics Sessional'],
  ['CE-302', 'Professional Practices and Communication Sessional'],


];

final List<String> pdfUrls = [
  "https://library.uoh.edu.iq/admin/ebooks/34875-structural_analysis_in_theory_and_practice.pdf",
  "https://www.portcity.edu.bd/files/636444713417370575_concretestructures.pdf",
  "https://priodeep.weebly.com/uploads/6/5/4/9/65495087/[elias_g._abu-saba___auth._]_design_of_steel_struc_bookzz.org_.pdf",
  "http://site.iugaza.edu.ps/afoul/files/2010/02/Environmental_book.pdf",
  "nai",
  "nai",
  "https://kwkhaing.files.wordpress.com/2014/12/budhu-soil-mechanics-foundations-3rd-txtbk.pdf",
  "https://mrcet.com/downloads/MBA/Professional%20Communication%20Skills.pdf",

];

class _civil_3y_1sState extends State<civil_3y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 3rd Year 1st Semester Book"),
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
                              builder: (context) => civil_3ye_1se(pdfUrl: pdfUrls[i]),
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


class civil_3ye_1se extends StatelessWidget {
  final String pdfUrl;

  const civil_3ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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