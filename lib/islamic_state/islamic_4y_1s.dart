import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class Islamic_4y_1s extends StatefulWidget {
  const Islamic_4y_1s({Key? key}) : super(key: key);

  @override
  State<Islamic_4y_1s> createState() => _Islamic_4y_1sState();
}

final List<List<String>> tableData = [
  ['IS-307', 'The Life Of The Prophet Muhammad (PBUH)'],
  ['IS-301', 'Hadith History and Principles'],
  ['IS-403', 'Ilmut Tasawwuf and Tazkiatun Nafs'],
  ['IS-109', 'First Principles of Islamic Economy'],
  ['IS-103', 'Principles of Islamic Jurisprudence'],
  ['IS-102', 'The Islamic Political System: A Basic Value Approach '],
  ['IS-110', 'World Religions '],
  ['IS-301', 'ISLAMIC INSURANCE A Modern Approach with Particular Reference'],


];

final List<String> pdfUrls = [
  "https://alrashidmosque.ca/wp-content/uploads/2019/05/The-Life-of-The-Prophet-Muhammad.pdf",
  "https://openmaktaba.com/hadith-history-and-principles/",
  "https://shibircloud.com/pdf/tajkiyatun_nafs.pdf",
  "https://www.maybank.com/iwov-resources/pdf/islamic/learning-centre/book-in-brief_1st-principle-islamic-economy.pdf",
  "https://www.islamland.com/uploads/books/en_Principles_of_Islamic_Jurisprudence_2.pdf",
  "https://mpra.ub.uni-muenchen.de/72706/1/MPRA_paper_72702.pdf",
  "https://www.eduappcenter.com/apps/751",
  "https://etheses.whiterose.ac.uk/518/1/uk_bl_ethos_496561.pdf",


];

class _Islamic_4y_1sState extends State<Islamic_4y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Islamic Studies 4th Year 1st Semester Book"),
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
                              builder: (context) => is_4ye_1se(pdfUrl: pdfUrls[i]),
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



class is_4ye_1se extends StatelessWidget {
  final String pdfUrl;

  const is_4ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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