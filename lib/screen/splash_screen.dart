import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/login.dart';
import 'package:rassasy_tab/screen/dashboard.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'company_list.dart';
//not use
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen1> {
  @override

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      startTimer();
    });
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    var companySelected = prefs.getBool('companySelected') ?? false;
    if (status) {
     if(companySelected){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DashBoard()));
    }
     else{
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
               builder: (BuildContext context) => const CompanyList()));
     }

    }

    else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child: SvgPicture.asset(
          "assets/svg/Logo.svg",
          fit: BoxFit.fitWidth,
        ));
  }
}
