import 'package:flutter/material.dart';
import 'package:pub_booklist/CSE/cse_books/cse_1y2s.dart';
import 'package:url_launcher/url_launcher.dart';


class cse_1y_2s extends StatefulWidget {
  const cse_1y_2s({Key? key}) : super(key: key);

  @override
  State<cse_1y_2s> createState() => _cse_1y_2sState();
}

final List<List<String>> tableData = [
  ['CSE-1201', 'Data Structures'],
  ['CSE-1202', 'Data Structures Sessional'],
  ['CSE-1203', 'Object Oriented Programming Language'],
  ['CSE-1204', 'Object Oriented Programming Language Sessional'],
  ['EEE-1201', 'Electronic Devices and Circuit'],
  ['EEE-1202', 'Electronic Devices and Circuit Sessional'],
  ['PHY-1201', 'Physics-II'],
  ['PHY-1202', 'Physics-II Sessional'],
  ['MTH-1201', 'Differential Equations and Transform Mathematics'],
  ['BAN-1201', 'Functional Bengali Language'],
  ['ENG-1202', 'Developing English Skills Sessional'],

];

final List<String> pdfUrls = [
  "https://lms.just.edu.bd/enrol/index.php?id=191",
  "https://mrcet.com/pdf/Lab%20Manuals/CSE/(R18A0584)%20Data%20Structures%20Lab%20Manual.pdf",
  "https://fac.ksu.edu.sa/sites/default/files/ObjectOrientedProgramminginC4thEdition.pdf",
  "https://mrcet.com/downloads/digital_notes/HS/OOP_10122018.pdf",
  "https://mohamadramdhani.staff.telkomuniversity.ac.id/files/2016/08/Electronic-Devices-and-Circuit-Theory-11th-Edition-Ebook.pdf",
  "https://mrcet.com/downloads/ECE/labmanuals/ELECTRONIC%20DEVICES%20&%20CIRCUITS%20LAB.pdf",
  "https://elearn.daffodilvarsity.edu.bd/pluginfile.php/987150/mod_label/intro/fundamentals-of-physics-textbook.pdf",
  "https://www.numerade.com/books/physics-for-scientists-and-engineers-with-modern-physics-8th/",
  "https://www.gov.nl.ca/education/files/k12_curriculum_guides_mathematics_math1201_mathematics_1201_cg_final.pdf",
  "nai",
  "https://www.gov.nl.ca/education/files/k12_curriculum_guides_english_english_1202_cg_2017.pdf"

];

class _cse_1y_2sState extends State<cse_1y_2s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 1st Year 2nd Semester Book"),
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
                              builder: (context) => Book_1y2s(pdfUrl: pdfUrls[i]),
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
