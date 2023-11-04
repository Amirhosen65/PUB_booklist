import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_3y_1s extends StatefulWidget {
  const cse_3y_1s({Key? key}) : super(key: key);

  @override
  State<cse_3y_1s> createState() => _cse_3y_1sState();
}

final List<List<String>> tableData = [
  ['CSE-333', 'Digital Electronics and Pulse Techniques'],
  ['CSE-334', 'Digital Electronics and Pulse Techniques Lab'],
  ['CSE-313', 'Operating System'],
  ['CSE-314', 'Operating System Lab'],
  ['CSE-331', 'Digital System Design'],
  ['CSE-332', 'Digital System Design Lab'],
  ['CSE-231', 'Computer Architecture and Organization'],
  ['CSE-327', 'Data Communication'],
  ['CSE-315', 'Mathematical Analysis for Computer Science'],


];

final List<String> pdfUrls = [
  "https://www.shahucollegelatur.org.in/Department/Studymaterial/sci/it/BCA/FY/digielec.pdf",
  "https://www.ssit.edu.in/dept/assignment/declabmanual.pdf",
  "https://www.mbit.edu.in/wp-content/uploads/2020/05/Operating_System_Concepts_8th_EditionA4.pdf",
  "https://www.scribd.com/document/408428908/OS-Lab-Manual-pdf",
  "https://dvikan.no/ntnu-studentserver/kompendier/digital-systems-design.pdf",
  "https://digitalsystemdesignblog.files.wordpress.com/2016/08/digital_system_design_manual.pdf",
  "https://g.co/kgs/BDk9CT",
  "https://www.portcity.edu.bd/files/636444710465881602_Dataandcomputercommunications.pdf",
  "https://courses.csail.mit.edu/6.042/spring17/mcs.pdf",

];

class _cse_3y_1sState extends State<cse_3y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 3rd Year 1st Semester Book"),
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
                              builder: (context) => cse_3ye_1se(pdfUrl: pdfUrls[i]),
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



class cse_3ye_1se extends StatelessWidget {
  final String pdfUrl;

  const cse_3ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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