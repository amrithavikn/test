import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rassasy_tab/auth/login/login.dart';
import 'package:rassasy_tab/setting/settings_page.dart';

import 'detail/customer/customer_details.dart';
import 'detail/pos/pos.dart';
import 'detail/product/create/product_details.dart';
import 'detail/product_group/product_group.dart';
import 'detail/report/report_page.dart';



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

          title: const Text("Dashboard",style: TextStyle(  fontWeight: FontWeight.bold,    color: Colors.black,fontSize: 23,  ),),
          backgroundColor: const Color(0xffF3F3F3),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: const TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: const IconThemeData(color: Colors.black)),
              child: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(value: 0, child: Text("Settings")),

                  const PopupMenuDivider(),
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
                onSelected: (item) => selectedItem(context, item),
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
                                                    const ProductDetails()));
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
                                                    const CustomerDetails()));
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
                                                  const POS()));
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
                                                    const ReportPage()));
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

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SettingsPage()));
        break;


      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          //(route) => false
        );
        break;
    }
  }
}