import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp( const Splash());
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,

              home:   NativeSplash());
        } else {
          // Loading is done, return the app:
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
          home:  LoginPage(),

          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NativeSplash extends StatelessWidget {
  const NativeSplash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xffF8F8F8),
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

    await Future.delayed(const Duration(seconds: 2)

    );

  }
  // void navigateUser(BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var status = prefs.getBool('isLoggedIn') ?? false;
  //   print(status);
  //   var companySelected = prefs.getBool('companySelected') ?? false;
  //   print(companySelected);
  //   if (status) {
  //     if(companySelected){
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => DashBoard()));
  //     }
  //     else{
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => CompanyList()));
  //     }
  //
  //   }
  //
  //   else {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  //   }
  // }

}
