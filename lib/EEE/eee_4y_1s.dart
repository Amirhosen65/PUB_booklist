import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_4y_1s extends StatefulWidget {
  const eee_4y_1s({Key? key}) : super(key: key);

  @override
  State<eee_4y_1s> createState() => _eee_4y_1sState();
}

final List<List<String>> tableData = [
  ['CSE-327', 'Microprocessor System and Interfacing'],
  ['CSE-328', 'Microprocessor System and Interfacing Lab'],
  ['EEE-473', 'Switching and Protection'],
  ['431-333', 'Computer Networking'],
  ['EEE-431', 'Power System II'],
  ['EEE-414', 'Power System I & II'],
  ['EEE-417', 'Control System Engineering'],
  ['EEE-418', 'Control System Engineering Lab'],
  ['EEE-435', 'Power Plant Engineering'],


];

final List<String> pdfUrls = [
  "https://adityaeeeb.weebly.com/uploads/4/2/0/0/42007913/mpmc_textbook_godse.pdf",
  "https://ggnindia.dronacharya.info/ECE/Downloads/Labmanuals/AUG09_DEC09/V_Sem/MICROPROCESSOR_lab_VthSem_ECE.pdf",
  "https://adityaeeeb.weebly.com/uploads/4/2/0/0/42007913/protection-and-switchgear_by_bakshi.pdf",
  "https://www.ucg.ac.me/skladiste/blog_44233/objava_64433/fajlovi/Computer%20Networking%20_%20A%20Top%20Down%20Approach,%207th,%20converted.pdf",
  "https://handoutset.com/wp-content/uploads/2022/02/Electrical-Power-Systems-by-C.-L.-Wadhwa.pdf",
  "https://web.nit.ac.ir/~shahabi.m/M.Sc%20and%20PhD%20materials/Power%20System%20Transient%20Analysis%20Course/Books/Power%20System%20Analysis%20and%20Design%20by%20Glover%20and%20Sarma_6thEdition.pdf",
  "http://freedownloads88.weebly.com/uploads/1/3/6/2/13624622/control_systems.pdf",
  "https://mjcollege.ac.in/images/labmannuals/III%20EIE%20II%20SEM%20CS%20LAB%20MANUAL(EE332).pdf",
  "http://www.gammaexplorer.com/wp-content/uploads/2014/03/Power-Plant-Engineering.pdf",

];

class _eee_4y_1sState extends State<eee_4y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 4th Year 1st Semester Book"),
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
                              builder: (context) => eee_4ye_1se(pdfUrl: pdfUrls[i]),
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



class eee_4ye_1se extends StatelessWidget {
  final String pdfUrl;

  const eee_4ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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