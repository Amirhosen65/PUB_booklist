import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eng_3rd extends StatefulWidget {
  const eng_3rd({Key? key}) : super(key: key);

  @override
  State<eng_3rd> createState() => _eng_3rdState();
}

final List<List<String>> tableData = [
  ['231501', 'History of Bengal, 1765-1905'],
  ['231503', 'History of South Asia, 1757-1857'],
  ['231505', 'History of West Asia, 1560 hrs.-1914'],
  ['231507', 'History of United States, 1776-1860 hrs.'],
  ['231509', 'History of England, 1485 to 1945'],
  ['231511', 'History of Africa Since Colonial Period'],
  ['231513', 'History of Europe, 1453-1815'],
  ['231515', 'Far East and South-East Asia in Modern Times'],


];

final List<String> pdfUrls = [
  "https://ia904709.us.archive.org/15/items/in.ernet.dli.2015.100802/2015.100802.The-History-Of-Bengal-Ed-1st1757-1905_text.pdf",
  "https://www.researchgate.net/publication/299528474_A_Brief_History_of_South_Asia",
  "https://www.delhipolicygroup.org/uploads_dpg/arch_publication_file/west-asia-in-transition-1003.pdf",
  "https://d3bxy9euw4e147.cloudfront.net/oscms-qa/media/documents/USHistory-LR.pdf",
  "https://www.globalgreyebooks.com/history-of-england-ebook.html",
  "http://isejarah.fib.unair.ac.id/wp-content/uploads/2017/09/AFRICANS-HISTORY-OF-CONTINENT-ilovepdf-compressed.pdf",
  "https://upload.wikimedia.org/wikipedia/commons/2/2b/A_General_History_of_Europe_-_Robinson%2C_Breasted%2C_Smith_%281921%29.pdf",
  "https://ignca.gov.in/Asi_data/16038.pdf",


];

class _eng_3rdState extends State<eng_3rd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English 3rd Year Book List"),
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
                              builder: (context) => eng_3ye(pdfUrl: pdfUrls[i]),
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


class eng_3ye extends StatelessWidget {
  final String pdfUrl;

  const eng_3ye({Key? key, required this.pdfUrl}) : super(key: key);

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