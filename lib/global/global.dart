import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

snackBarMessage(BuildContext context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

start(context) {
  Loader.show(context,
      progressIndicator: CircularProgressIndicator(),
      overlayColor: Colors.transparent,
      themeData: ThemeData(colorScheme:ColorScheme.dark(primary: Color(0xffffab00))
      )
  );
}

class BaseUrl{

  static String bUrl =   "https://www.erp.vikncodes.com/api/v8";
  static int branchID =   1;
  static int priceRounding=2;


}

stop() {
  Future.delayed(Duration(seconds: 0), () {
    Loader.hide();
  });
}

class Global {

  static InputDecoration textFieldBottomBorder(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      hintText: hintTextStr,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFAFAFA)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xffffab00)),
      ),
    );
  }

  static InputDecoration textField(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      filled: true,
    fillColor:Color(0xffF8F8F8) ,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
      hintText: hintTextStr,
      labelStyle:
      const TextStyle(color: Color(0xff9F9F9F), fontSize: 14),
      labelText: labelTextStr,
      contentPadding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
    );
  }
}

