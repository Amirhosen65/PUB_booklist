import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_2y_1s extends StatefulWidget {
  const civil_2y_1s({Key? key}) : super(key: key);

  @override
  State<civil_2y_1s> createState() => _civil_2y_1sState();
}

final List<List<String>> tableData = [
  ['CE-201', 'Engineering Materials'],
  ['CE-211', 'Mechanics of Solids-I'],
  ['CE-251', 'Fluid Mechanics'],
  ['HUM-201', 'Engineering Economics'],
  ['MTH-105', 'Laplace Transform and Vector Analysis'],
  ['CE-202', 'Engineering Materials Sessional'],
  ['CE-200', 'Details of Construction Sessional'],

];


final List<String> pdfUrls = [
  "https://doc.lagout.org/electronics/Materials%20for%20engineering%20%5Bby%20John%20Martin%5D.pdf",
  "https://drive.google.com/file/u/0/d/13zcoMoTj-IvjMO4MfY3HGnfK8h8nBbPu/view",
  "https://home.iitk.ac.in/~nikhilk/Book.pdf",
  "https://www.hzu.edu.in/engineering/engineering%20economy.pdf",
  "http://www.uop.edu.pk/ocontents/Vector%20Analysis%20Schaum.pdf",
  "https://www.aust.edu/lab_manuals/CE/ce_202.pdf",
  "https://www.portcity.edu.bd/files/636444712468546444_buildingmaterials.pdf",


];

class _civil_2y_1sState extends State<civil_2y_1s> {
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
                              builder: (context) => cvil_2ye_1se(pdfUrl: pdfUrls[i]),
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



class cvil_2ye_1se extends StatelessWidget {
  final String pdfUrl;

  const cvil_2ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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