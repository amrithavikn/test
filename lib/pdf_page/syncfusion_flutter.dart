import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Syncfusion_flutter extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => new _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<Syncfusion_flutter> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController controller = new TextEditingController();

  // start() {
  //   Loader.show(context,
  //       progressIndicator: CircularProgressIndicator(),
  //       themeData: Theme.of(context).copyWith(accentColor: Color(0xff02BAB7)),
  //       overlayColor: Color(0x99E8EAF6));
  // }
  //
  // stop() {
  //   Future.delayed(Duration(seconds: 0), () {
  //     Loader.hide();
  //   });
  // }



  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.red,
          child: SfPdfViewer.asset(
              'assets/pdf/Terms_and_conditionconverted.pdf'),
        ));
  }
}

