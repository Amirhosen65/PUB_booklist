import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class BBA_6th_SEM extends StatefulWidget {
  const BBA_6th_SEM({Key? key}) : super(key: key);

  @override
  State<BBA_6th_SEM> createState() => _BBA_6th_SEMState();
}

final List<List<String>> tableData = [
  ['EEE-237', 'Digital Electronics'],
  ['EEE-238', 'Digital Electronics Lab'],
  ['EEE-300', 'Project'],
  ['EEE-311', 'Measurements and Instrumentation'],
  ['EEE-312', 'Measurements and Instrumentation Lab'],
  ['EEE-315', 'Electrical Machine II'],
  ['EEE-316', 'Electrical Machine I & II'],
  ['EEE-319', 'Signals and Systems'],


];

final List<String> pdfUrls = [
  "https://gacbe.ac.in/images/E%20books/Digital%20Electronics%20Demystified%20-%20M.%20Predko%20(McGraw-Hill,%202005).pdf",
  "https://kanchiuniv.ac.in/coursematerials/Digital_Electronics.pdf",
  "Not Found",
  "https://pasargadabzar.com/wp-content/uploads/2022/04/Morris_Langari-1.pdf",
  "https://www.vssut.ac.in/lecture_notes/lecture1423813026.pdf",
  "https://easyengineering.net/ee6504-electrical-machines-ii/",
  "https://mrcet.com/downloads/digital_notes/EEE/EM-I%20DIGITAL%20NOTES%20LATEST-EEE.pdf",
  "https://eee.guc.edu.eg/Courses/Communications/COMM401%20Signal%20&%20System%20Theory/Alan%20V.%20Oppenheim,%20Alan%20S.%20Willsky,%20with%20S.%20Hamid-Signals%20and%20Systems-Prentice%20Hall%20(1996).pdf",


];

class _BBA_6th_SEMState extends State<BBA_6th_SEM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA 6th Semester Book"),
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
                              builder: (context) => bba_1ye_2se(pdfUrl: pdfUrls[i]),
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



class bba_1ye_2se extends StatelessWidget {
  final String pdfUrl;

  const bba_1ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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