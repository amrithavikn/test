import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => new _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PdfViewer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // child:   pdf.addPage(
            //   pw.Page(
            //     build: (pw.Context context) => pw.Center(
            //       child: pw.Text('Hello World!'),
            //     ),
            //   ),
            ));


  }
}

Future<void> _pdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final file = File('assets/pdf/terms.pdf');
  await file.writeAsBytes(await pdf.save());
}