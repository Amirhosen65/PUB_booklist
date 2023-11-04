import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_4y_2s extends StatefulWidget {
  const civil_4y_2s({Key? key}) : super(key: key);

  @override
  State<civil_4y_2s> createState() => _civil_4y_2sState();
}

final List<List<String>> tableData = [
  ['HUM-401', 'Professional Ethics'],
  ['CE-415', 'Pre-stressed Concrete'],
  ['CE-417', 'Design of Concrete Structure-III'],
  ['CE-441', 'Traffic Engineering Design and Management'],
  ['CE-455', 'River Engineering'],
  ['CE-418', 'Computer Aided Analysis and Design of Structures Sessional'],
  ['CE-446', 'Pavement Design and Traffic Studies Sessional'],
  ['CE-208', 'Quantity Surveying Sessional'],
  ['CE-322', 'Environmental Engineering Sessional'],
  ['CE-352', 'Open Channel Flow Sessional'],
  ['CE-400(A)', 'Project/Thesis'],
  ['CE-400(B)', 'Project/Thesis'],


];

final List<String> pdfUrls = [
  "https://d1wqtxts1xzle7.cloudfront.net/59859137/Professional_Ethics_and_Human_Values_by_R.S_NAAGARAZAN20190625-107305-1hve3cf-libre.pdf?1561457751=&response-content-disposition=attachment%3B+filename%3DProfessional_Ethics_and_Human_Values_by.pdf&Expires=1692463466&Signature=JUiOuMmeC7P9oURairmS2c8n1TE0sIHHt7c30EWyhnWHqo5e5-bW1mckyMFSgcfPIubvysU1k7kKO1K~jSUdBAA92m-e12CsCJubOwdEjv44~AFcVWmnX-k7JA4278wS9qfJE4HJTLGuRbLzFTfVWclfx66bePiHrd1c2SAauCP0cAQ1ErTg~9HwpeWek-rRM4O7Q-djBMxaTKkpqyI1hZiXK94uTIXVKzqgQQENckT8VWpATRaT4~hRa7d0QlnbG~YSCBvnBfoVdvCMLC7lhrAa2gXvkTeFIA8ETYO4OggbaSsdg9T7efr4pQZxX71lZeK~DTl9MdDTWsE~uHxXgg__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA",
  "https://railtec.illinois.edu/wp/wp-content/uploads/Nawy-2009-Prestressed-Concrete.pdf",
  "https://weccivilians.weebly.com/uploads/2/4/6/2/24623713/design_of_reinforced_concrete_9th_edition_-_jack_c._mccormac.pdf",
  "https://drive.google.com/file/d/1im1mC9qIN2mHj_FrVnMPgTrXTJAGH7vL/view?usp=sharing",
  "https://johndfenton.com/Lectures/RiverEngineering/River-Engineering.pdf",
  "https://mlritm.ac.in/assets/civil/civil_manuals/R19_civil_labmanuals/R19%20-%20CAD%20II%20Lab%20Manual.pdf",
  "https://nitsri.ac.in/Department/Civil%20Engineering/Traffic_Engineering_Lab_Manual.pdf",
  "https://content.kopykitab.com/ebooks/2018/09/22260/sample/sample_22260.pdf",
  "https://www.aust.edu/lab_manuals/CE/ce_432.pdf",
  "https://www.scribd.com/presentation/476619231/Open-Channel-Flow-Sessional",

];


class _civil_4y_2sState extends State<civil_4y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 4th Year 2nd Semester Book"),
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
                              builder: (context) => civil_4ye_2se(pdfUrl: pdfUrls[i]),
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



class civil_4ye_2se extends StatelessWidget {
  final String pdfUrl;

  const civil_4ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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