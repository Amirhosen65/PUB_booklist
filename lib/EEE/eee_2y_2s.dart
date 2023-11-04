import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eee_2y_2s extends StatefulWidget {
  const eee_2y_2s({Key? key}) : super(key: key);

  @override
  State<eee_2y_2s> createState() => _eee_2y_2sState();
}

final List<List<String>> tableData = [
  ['EEE-211', 'Circuit Analysis II'],
  ['EEE-227', 'Electronics II'],
  ['EEE-228', 'Electronics II Lab'],
  ['EEE-230', 'Circuit Simulation Lab'],
  ['EEE-235', 'Electrical Machine I'],
  ['EEE-239', 'Electro-Magnetic Fields'],
  ['MAT-221', 'Complex Variable and Laplace,Fourier and Z Transform'],
  ['BAM-225', 'Principles of Business,Accounting and Management'],


];

final List<String> pdfUrls = [
  "https://library.uoh.edu.iq/admin/ebooks/88917-electronics---schaum's-outline---theory-&-problems-of-basic-circuit-analysis.pdf",
  "https://www.shahucollegelatur.org.in/Department/Studymaterial/sci/it/BCA/FY/digielec.pdf",
  "https://mjcollege.ac.in/images/labmannuals/BasicElectroniclabmanualBIT231.pdf",
  "http://www.eletrica.ufpr.br/graduacao/e-books/Prentice%20Hall%20-%20SPICE%20A%20Guide%20to%20Circuit%20Simulation%20and%20Analysis%20using%20pspice.pdf",
  "https://referenceglobe.com/CollegeLibrary/library_books/20200125041045198204Electrical%20Machines%20by%20Mr.%20S.%20K.%20Sahdev.pdf",
  "https://vtechworks.lib.vt.edu/bitstream/handle/10919/93253/Electromagnetics_Vol2.pdf",
  "http://www.puissancemaths.com/analyseEsib/analyse2/23864741-Complex-Variables-and-the-Laplace-Transform-for-Engineers.pdf",
  "http://www.mim.ac.mw/books/Frank%20Wood's%20Business%20Accounting%201.pdf",
  "",
  "",

];

class _eee_2y_2sState extends State<eee_2y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEE 2nd Year 2nd Semester Book"),
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
                              builder: (context) => eee_2ye_2se(pdfUrl: pdfUrls[i]),
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



class eee_2ye_2se extends StatelessWidget {
  final String pdfUrl;

  const eee_2ye_2se({Key? key, required this.pdfUrl}) : super(key: key);

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