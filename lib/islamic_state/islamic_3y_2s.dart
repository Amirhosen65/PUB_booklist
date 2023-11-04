import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class Islamic_3y_2s extends StatefulWidget {
  const Islamic_3y_2s({Key? key}) : super(key: key);

  @override
  State<Islamic_3y_2s> createState() => _Islamic_3y_2sState();
}

final List<List<String>> tableData = [
  ['IS-209', 'Modern Muslim world and Organizations'],
  ['IS-203', 'Bachelor of Arts in Islamic Studies B.A.'],
  ['IS-403', 'Ilmut Tasawwuf and Tazkiatun Nafs'],
  ['IS-109', 'First Principles of Islamic Economy'],



];

final List<String> pdfUrls = [
  "https://shibircloud.com/pdf/tajkiyatun_nafs.pdf",
  "https://tnou.ac.in/wp-content/uploads/2021/01/BA-Islamic-Studies.pdf",
  "https://shibircloud.com/pdf/tajkiyatun_nafs.pdf",
  "https://www.maybank.com/iwov-resources/pdf/islamic/learning-centre/book-in-brief_1st-principle-islamic-economy.pdf",



];

class _Islamic_3y_2sState extends State<Islamic_3y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Islamic Studies 3rd Year 2nd Semester Book"),
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
                              builder: (context) => is_3ye_2se(pdfUrl: pdfUrls[i]),
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



class is_3ye_2se extends StatelessWidget {
  final String pdfUrl;

  const is_3ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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