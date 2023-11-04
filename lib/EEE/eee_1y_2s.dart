import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_1y_2s extends StatefulWidget {
  const eee_1y_2s({Key? key}) : super(key: key);

  @override
  State<eee_1y_2s> createState() => _eee_1y_2sState();
}

final List<List<String>> tableData = [
  ['EEE-1201', 'Electrical Circuits II'],
  ['EEE-1202', 'Electrical Circuits II Lab'],
  ['EEE-1203', 'Engineering Materials'],
  ['EEE-1217', 'Engineering Electromagnetic'],
  ['MTH-1201', 'Differential Equations and Transform Mathematics'],
  ['PHY-1201', 'Physics II'],
  ['PHY-1202', 'Physics II Lab'],
  ['ENG-1202', 'Developing English Skills Lab'],
  ['BAN-1201', 'Function Bengali Language'],

];

final List<String> pdfUrls = [
  "https://mrcet.com/downloads/digital_notes/HS/5%20Electrical%20Circuits.pdf",
  "https://www.kau.edu.sa/Files/0056868/Subjects/3.%20Electrical%20Circuits%20Laboratory%20Manual.pdf",
  "https://doc.lagout.org/electronics/Materials%20for%20engineering%20%5Bby%20John%20Martin%5D.pdf",
  "http://www.uop.edu.pk/ocontents/EMT.pdf",
  "https://ia801500.us.archive.org/33/items/DifferentialEquations3rdEditionShepleyL.Ross/Differential%20equations%203rd%20edition%20Shepley%20L.Ross.pdf",
  "https://d3bxy9euw4e147.cloudfront.net/oscms-qa/media/documents/UniversityPhysicsVolume2-OP.pdf",
  "https://physics.iyte.edu.tr/wp-content/uploads/sites/83/2020/10/PHYS112-LabManual.pdf",
  "https://www.geethanjaliinstitutions.com/engineering/labmanuals/downloads/cse/aecs%20lab.pdf",
  "https://demo.aiub.edu/eng-1101",

];

class _eee_1y_2sState extends State<eee_1y_2s> {
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
                              builder: (context) => eee_1ye_2se(pdfUrl: pdfUrls[i]),
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


class eee_1ye_2se extends StatelessWidget {
  final String pdfUrl;

  const eee_1ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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