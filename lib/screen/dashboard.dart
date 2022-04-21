import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rassasy_tab/login.dart';
import 'package:rassasy_tab/screen/pos.dart';
import 'package:rassasy_tab/screen/product_details.dart';
import 'package:rassasy_tab/screen/product_group.dart';
import 'package:rassasy_tab/screen/report_page.dart';
import 'package:rassasy_tab/screen/settings_page.dart';

import 'customer_details.dart';


class DashBoard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Dashboard",style: TextStyle(  fontWeight: FontWeight.bold,    color: Colors.black,fontSize: 23,  ),),
          backgroundColor: Color(0xffF3F3F3),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: const Text("Settings")),
                  // const PopupMenuItem<int>(
                  //     value: 1, child: Text("Privacy Policy page")),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Logout")
                        ],
                      )),
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
        ),
        body: Center(
            child: SizedBox(
              height:
              MediaQuery.of(context).size.height / 1.5, //height of button
              width: MediaQuery.of(context).size.width / 2.5,
              //    color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.green,

                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 2,
                                //   color: Colors.blue,
                                child: Column(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                const ProductGroup()));
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/productgroup.svg'),
                                      iconSize: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Product Group')
                                ])),

                            //heree

                            SizedBox(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 2,
                                //   color: Colors.red,
                                child: Column(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                    ProductDetails()));
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/products.svg'),
                                      iconSize: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Products')
                                ])),
                          ])),
                  SizedBox(

                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 10,
                                height: MediaQuery.of(context).size.height / 2,
                                // color: Colors.blue,
                                child: Column(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                    CustomerDetails()));
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/customer.svg'),
                                      iconSize: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Customer')
                                ])),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 2,
                              // color: Colors.pink,
                              child: Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  POS()));
                                    },
                                    icon:
                                    SvgPicture.asset("assets/svg/POS.svg"),
                                    iconSize: 70,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('POS'),
                              ]),
                            )
                          ])),
                  SizedBox(
//color: Colors.green,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 2,
                              // color: Colors.pink,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                    ReportPage()));
                                      },
                                      icon: SvgPicture.asset(
                                          "assets/svg/report.svg"),
                                      iconSize: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Reports')
                                ],
                              ),
                            )
                          ])),
                ],
              ),
            )));

  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingsPage()));
        break;

      case 1:
        print("User Logged out");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
          //(route) => false
        );
        break;
    }
  }
}