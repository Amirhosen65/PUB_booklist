import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class bookPdf extends StatefulWidget {
  const bookPdf({super.key});

  @override
  State<bookPdf> createState() => _bookPdfState();
}

class _bookPdfState extends State<bookPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("PDF View"),
        ),
        body:
        // link fron internet
        SfPdfViewer.network(
          "https://mycsvtunotes.weebly.com/uploads/1/0/1/7/10174835/computer_fundamental_complete-i.pdf",
        )
      // SfPdfViewer.asset("asset/proposal.pdf"),
    );
  }
}





