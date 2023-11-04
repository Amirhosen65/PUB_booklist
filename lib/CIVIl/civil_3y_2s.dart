import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class civil_3y_2s extends StatefulWidget {
  const civil_3y_2s({Key? key}) : super(key: key);

  @override
  State<civil_3y_2s> createState() => _civil_3y_2sState();
}

final List<List<String>> tableData = [
  ['CE-315', 'Design of Concrete Structures-II'],
  ['CE-421', 'Environmental Engineering-II'],
  ['CE-341', 'Transportation Planning and Traffic Engineering'],
  ['CE-351', 'Open Channel Flow'],
  ['CE-312', 'Environmental Engineering Sessional-I'],
  ['CE-303', 'Project Planning and Construction Management'],
  ['CE-322', 'Environmental Engineering Sessional'],
  ['CE-352', 'Open Channel Flow Sessional'],
  ['CE-314', 'Design of Concrete Steel Sessional'],
  ['ENG-102', 'Developing English Skills Sessional'],


];

final List<String> pdfUrls = [
  "https://weccivilians.weebly.com/uploads/2/4/6/2/24623713/design_of_reinforced_concrete_9th_edition_-_jack_c._mccormac.pdf",
  "https://www.aust.edu/lab_manuals/CE/ce_432.pdf",
  "http://site.iugaza.edu.ps/emasry/files/2010/09/Transport-Planning-and-traffic-engineering.pdf",
  "https://heidarpour.iut.ac.ir/sites/heidarpour.iut.ac.ir/files//u32/open-chaudhry.pdf",
  "https://bbdnitm.ac.in/wp-content/uploads/2022/05/environmental-engineering-lab-manual.pdf",
  "https://ftp.idu.ac.id/wp-content/uploads/ebook/ip/BUKU%20MANAJEMEN%20PROYEK/Construction%20management%20for%20industrial%20projects%20_%20a%20modular%20guide%20for%20project%20managers%20(%20PDFDrive%20).pdf",
  "https://www.jnec.org/labmanuals/civil/te/sem1/EE%20%20lab%20manual%20CIVIL%202018-19-%20Modified.pdf",
  "https://www.scribd.com/presentation/476619231/Open-Channel-Flow-Sessional",
  "https://priodeep.weebly.com/uploads/6/5/4/9/65495087/[elias_g._abu-saba___auth._]_design_of_steel_struc_bookzz.org_.pdf",
  "https://bawar.net/data0/books/5a1a48c05439c/pdf/English%20Language%20Communication%20Skills.pdf",

];

class _civil_3y_2sState extends State<civil_3y_2s> {
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
                              builder: (context) => civil_3ye_2se(pdfUrl: pdfUrls[i]),
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


class civil_3ye_2se extends StatelessWidget {
  final String pdfUrl;

  const civil_3ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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