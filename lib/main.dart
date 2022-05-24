 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/auth/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/login/company/select_company.dart';
import 'dashboard/dashboard.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,

  ]).then((_){
    runApp(MyApp());
  });


  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(
  //     SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash dashboard while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home:  Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,

                textSelectionTheme: const TextSelectionThemeData(
                //  cursorColor: Colors.green,
                  selectionColor: Colors.transparent,
                 // selectionHandleColor: Colors.blue,
                )


            ),
            debugShowCheckedModeBanner: false,
            home:  MyHomePage(),
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateUser();

  }
  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    var companySelected = prefs.getBool('companySelected') ?? false;
    print(companySelected);
    if (status) {
      if (companySelected) {
        Navigator.pushReplacement(context,
            //dashboard
           // MaterialPageRoute(builder: (BuildContext context) => EnterPinNumber()));310004
            MaterialPageRoute(builder: (BuildContext context) => DashBoard()));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CompanyList()));
      }
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
          SvgPicture.asset('assets/svg/Logo.svg')

      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Color(0xffF8F8F8),
      body: Center(
          child:
          SvgPicture.asset('assets/svg/Logo.svg')

      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {

    await Future.delayed(const Duration(seconds: 2));
  }
}


 class MyHttpOverrides extends HttpOverrides{
   @override
   HttpClient createHttpClient(SecurityContext? context){
     return super.createHttpClient(context)
       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
   }
 }









