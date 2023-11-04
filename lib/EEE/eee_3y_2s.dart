import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_3y_2s extends StatefulWidget {
  const eee_3y_2s({Key? key}) : super(key: key);

  @override
  State<eee_3y_2s> createState() => _eee_3y_2sState();
}

final List<List<String>> tableData = [
  ['EEE-3223', 'Communication I'],
  ['EEE-325', 'Electrical Machine III'],
  ['EEE-329', 'Power Transmission and Distribution'],
  ['EEE-331', 'Power Electronics'],
  ['EEE-332', 'Power Electronics Lab'],
  ['EEE-333', 'Communication II'],
  ['EEE-334', 'Communication I & II Lab'],
  ['EEE-337', 'Digital Signal Processing I'],
  ['EEE-339', 'Power System I'],

];

final List<String> pdfUrls = [
  "https://dl.uswr.ac.ir/bitstream/Hannan/141245/1/9781138219120.pdf",
  "https://easyengineering.net/electrical-machines-iii-by-bakshi-nw/",
  "http://www.iqytechnicalcollege.com/EE%20513%20Power%20Transmission%20and%20Practical%20Power%20Distribution.pdf",
  "https://mrcet.com/downloads/Labmanuals/EEE/POWER%20ELECTRONICS%20LAB%20MANUAL.pdf",
  "https://www.cag.edu.tr/uploads/site/lecturer-files/mary-guffey-essentials-of-business-communication-2016-yzss.pdf",
  "https://mjcollege.ac.in/images/labmannuals/Communication%20Lab%20Manual%203-2.pdf",
  "https://mjcollege.ac.in/images/labmannuals/Communication%20Lab%20Manual%203-2.pdf",
  "https://books-library.net/files/books-library.net-02182115Nk1L2.pdf",
  "https://handoutset.com/wp-content/uploads/2022/02/Electrical-Power-Systems-by-C.-L.-Wadhwa.pdf",

];

class _eee_3y_2sState extends State<eee_3y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 3rd Year 2nd Semester Book"),
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
                              builder: (context) => eee_3ye_2se(pdfUrl: pdfUrls[i]),
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



class eee_3ye_2se extends StatelessWidget {
  final String pdfUrl;

  const eee_3ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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