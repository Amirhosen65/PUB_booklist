import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_4y_1s extends StatefulWidget {
  const cse_4y_1s({Key? key}) : super(key: key);

  @override
  State<cse_4y_1s> createState() => _cse_4y_1sState();
}

final List<List<String>> tableData = [
  ['CSE-411', 'Computer Graphics'],
  ['CSE-412', 'Computer Graphics Lab'],
  ['CSE-413', 'Cryptography and Network Security'],
  ['CSE-414', 'Cryptography and Network Security Lab'],
  ['CSE-415', 'Artificial Intelligence'],
  ['CSE-416', 'Artificial Intelligence Lab'],
  ['CSE-417', 'Software Engineering'],
  ['CSE-473', 'Elective Course-I/Wireless Networks'],
  ['CSE-499(A)', 'Thesis or Project Work'],

];

final List<String> pdfUrls = [
  "https://ia902203.us.archive.org/22/items/DonaldHearnM.PaulineBakerComputerGraphicsBookFi.org/%5BDonald_Hearn%2C_M._Pauline_Baker%5D_Computer_Graphics%28BookFi.org%29.pdf",
  "https://vardhamancse.yolasite.com/resources/Computer%20Graphics%20Lab%20Manual.pdf",
  "http://www.inf.ufsc.br/~bosco/ensino/ine5680/material-cripto-seg/2014-1/Stallings/Stallings_Cryptography_and_Network_Security.pdf",
  "https://learn.copyblogger.com/fill-and-sign-pdf-form/Book?item=Cryptography-And-Network-Security-Lab-Programs-In-Java(2).pdf",
  "https://people.engr.tamu.edu/guni/csce421/files/AI_Russell_Norvig.pdf",
  "http://srmcem.ac.in/pdf/AI%20LAB%20MANUAL.pdf",
  "https://engineering.futureuniversity.com/BOOKS%20FOR%20IT/Software-Engineering-9th-Edition-by-Ian-Sommerville.pdf",
  "https://www.booksfree.org/wp-content/uploads/2022/02/Wireless-Networking-Kumar-2008.pdf",
  "nai",


];

class _cse_4y_1sState extends State<cse_4y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 4th Year 1st Semester Book"),
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
                              builder: (context) => cse_4ye_1se(pdfUrl: pdfUrls[i]),
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




class cse_4ye_1se extends StatelessWidget {
  final String pdfUrl;

  const cse_4ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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