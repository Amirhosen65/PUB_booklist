import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';


class eng_4th extends StatefulWidget {
  const eng_4th({Key? key}) : super(key: key);

  @override
  State<eng_4th> createState() => _eng_4thState();
}

final List<List<String>> tableData = [
  ['241101', 'Nineteenth Century Novel'],
  ['231503', 'Twentieth Century Poetry'],
  ['231505', 'Modern Drama'],
  ['231507', 'Twentieth Century Novel'],
  ['231509', 'American Poetry'],
  ['231511', 'American Literature: Fiction and       American Literature: Fiction and Drama'],
  ['231513', 'Classics in Translation'],
  ['231515', 'Literary Criticism (From Victorian to Modern Age)'],
  ['241117 or 241119', 'Continental Literature Or Approaches and Methods of Language Teaching'],

];

final List<String> pdfUrls = [
  "https://www.scribd.com/document/138287492/The-19th-Century-Novel",
  "https://www.noor-book.com/en/ebook-%D8%A7%D9%84%D8%B1%D9%88%D8%A7%D9%8A%D9%87-%D8%A7%D9%84%D8%A7%D9%86%D8%AC%D9%84%D9%8A%D8%B2%D9%8A%D9%87-%D9%81%D9%8A-%D8%A7%D9%84%D9%82%D8%B1%D9%86-%D8%A7%D9%84%D8%B9%D8%B4%D8%B1%D9%8A%D9%86--pdf",
  "https://www.scribd.com/document/493301294/Modern-Drama-Copy",
  "http://shiraz.fars.pnu.ac.ir/portal/file/?970502/Twentieth-Century-Poetry-Blackwell-Companion.pdf",
  "https://uerjundergradslit.files.wordpress.com/2021/02/the-oxford-book-of-american-poetry-2006.pdf",
  "https://static.america.gov/uploads/sites/8/2016/05/2007_Outline_AmericanLiterature_English_Digital.pdf",
  "https://www.academia.edu/3770060/Classics_in_Translation",
  "https://uogbooks.files.wordpress.com/2014/10/literary-criticism-habib.pdf",
  "https://courstika.com/continental-literature-suggestion-pdf-honours-4th-year/",


];

class _eng_4thState extends State<eng_4th> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English 4th Year Book List"),
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
                              builder: (context) => eng_4ye(pdfUrl: pdfUrls[i]),
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


class eng_4ye extends StatelessWidget {
  final String pdfUrl;

  const eng_4ye({Key? key, required this.pdfUrl}) : super(key: key);

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