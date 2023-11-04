import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class Islamic_2y_1s extends StatefulWidget {
  const Islamic_2y_1s({Key? key}) : super(key: key);

  @override
  State<Islamic_2y_1s> createState() => _Islamic_2y_1sState();
}

final List<List<String>> tableData = [
  ['IS-209', 'Modern Muslim world and Organizations'],
  ['IS-404', 'Introduction to Muslim Philosophy'],
  ['IS-201', 'Fiqh of Ibadat'],
  ['IS-202', 'Islamic Civilization'],
  ['IS-408', 'Human Rights in Islam'],
  ['IS-204', 'Al-Tafsir (Sura An-Nur)'],


];

final List<String> pdfUrls = [
  "nai",
  "http://www.muslimphilosophy.com/hmp/hmp-v1.pdf",
  "https://www.emaanlibrary.com/wp-content/uploads/2015/05/Shafii-Fiqhul-Ibadaat-By-Hajja-Durriah-Aitah.pdf",
  "https://www.muslim-library.com/dl/books/English-Islam-And-Civilization.pdf",
  "https://www.noor-book.com/book/internal_download/659f33f5ae6218240fa59a3e2ba7195b327be0b8/1/d760fc795ac2581b67929c9e563216ab",
  "https://allonlineislam.com/surah-noor-pdf/",

];

class _Islamic_2y_1sState extends State<Islamic_2y_1s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Islamic Studies 2nd Year 1st Semester Book"),
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
                              builder: (context) => is_2ye_1se(pdfUrl: pdfUrls[i]),
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


class is_2ye_1se extends StatelessWidget {
  final String pdfUrl;

  const is_2ye_1se({Key? key, required this.pdfUrl}) : super(key: key);

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