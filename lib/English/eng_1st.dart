import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eng_1st extends StatefulWidget {
  const eng_1st({Key? key}) : super(key: key);

  @override
  State<eng_1st> createState() => _eng_1stState();
}

final List<List<String>> tableData = [
  ['211101', 'English Reading Skills'],
  ['211103', 'English Writing Skills'],
  ['211105', 'Introduction to Poetry'],
  ['211107', 'Introduction to Prose: Fiction and Non- Fiction:'],
  ['212009', 'Introducing Sociology or'],
  ['212111', 'Introduction to Social Work or'],
  ['211909', 'Introduction to Political Theory'],
  ['211501', 'History of the Emergence of Independent Bangladesh'],

];

final List<String> pdfUrls = [
  "https://ric.edu.pk/wp-content/uploads/2021/08/English-Reading-Skills.pdf",
  "https://americanenglish.state.gov/files/ae/resource_files/developing_writing.pdf",
  "https://library.oapen.org/bitstream/id/9b834c3e-0f38-4500-8b42-b2f415bd357e/9781317532590.pdf",
  "https://library.oapen.org/bitstream/id/18b84321-64aa-448b-8d77-c94d6119e478/9781783748112.pdf",
  "https://assets.openstax.org/oscms-prodcms/media/documents/IntroductiontoSociology3e-WEB_TZsroiv.pdf",
  "https://www.hzu.edu.in/uploads/2020/9/Introduction%20to%20Social%20Work%20and%20Social%20Welfare_%20Empowering%20People.pdf",
  "https://mgdc-chararisharief.com/elearn/Political%20Theory-1stSem.pdf",
  "https://muhith.info.bd/pdf/bangladesh%20emergence%20of%20a%20nation.pdf",


];

class _eng_1stState extends State<eng_1st> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English 1st Year Book List"),
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
                              builder: (context) => eng_1ye(pdfUrl: pdfUrls[i]),
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


class eng_1ye extends StatelessWidget {
  final String pdfUrl;

  const eng_1ye({Key? key, required this.pdfUrl}) : super(key: key);

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