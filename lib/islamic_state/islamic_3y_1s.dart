import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class Islamic_3y_1s extends StatefulWidget {
  const Islamic_3y_1s({Key? key}) : super(key: key);

  @override
  State<Islamic_3y_1s> createState() => _Islamic_3y_1sState();
}

final List<List<String>> tableData = [
  ['IS-209', 'Modern Muslim world and Organizations'],
  ['IS-404', 'Introduction to Muslim Philosophy'],
  ['IS-203', 'Jurisprudence of Ibadate(Fiqhul Ibadat)'],
  ['IS-304', 'History of Muslim Rule & Islamic Civilization'],
  ['IS-403', 'Ilmut Tasawwuf and Tazkiatun Nafs'],


];

final List<String> pdfUrls = [
  "nai",
  "http://www.muslimphilosophy.com/hmp/hmp-v1.pdf",
  "https://darpdfs.org/wp-content/uploads/2022/10/Fiqh-of-Worship-Sh.-al-%E2%80%98Uthaymeen.pdf",
  "https://edisciplinas.usp.br/pluginfile.php/6379279/mod_resource/content/1/A%20History%20of%20Islamic%20Societies%20-%20Ira%20M.%20Lapidus.pdf",
  "https://shibircloud.com/pdf/tajkiyatun_nafs.pdf",


];

class _Islamic_3y_1sState extends State<Islamic_3y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Islamic Studies 3rd Year 1st Semester Book"),
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
                              builder: (context) => is_3ye_1se(pdfUrl: pdfUrls[i]),
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



class is_3ye_1se extends StatelessWidget {
  final String pdfUrl;

  const is_3ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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