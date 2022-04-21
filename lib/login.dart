import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/screen/company_list.dart';
import 'package:rassasy_tab/screen/dashboard.dart';
import 'package:rassasy_tab/screen/product_group.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'global/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

TextEditingController userNameController = TextEditingController()
  ..text = "amrithaVikn";
TextEditingController userPasswordController = TextEditingController()
  ..text = "12345678A";

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.5, //height of button
          width: MediaQuery.of(context).size.width / 2.6,
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height /
                          10, //height of button
                      width: MediaQuery.of(context).size.width /
                          2, //width of button
                      child: ElevatedButton(
                        child: SvgPicture.asset(
                          "assets/svg/rassasy.svg",
                          matchTextDirection: false,
                        ),
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                            primary: Color(0xffECECEC),
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(
                                20) //content padding inside button
                            ),
                        onPressed: () {},
                      )),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Log In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      10, //height of button
                  width:
                      MediaQuery.of(context).size.width / 2, //width of button

                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: userNameController,
                      decoration: Global.textField(
                          hintTextStr: "Username", labelTextStr: "Username"),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      10, //height of button
                  width:
                      MediaQuery.of(context).size.width / 2,
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: userPasswordController,
                      obscureText: true,
                      decoration: Global.textField(
                          labelTextStr: "Password", hintTextStr: "Password"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: MediaQuery.of(context).size.height /
                        12, //height of button
                    width:
                        MediaQuery.of(context).size.width / 2, //width of button
                    child: Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height /
                              2, //height of button
                          width: MediaQuery.of(context).size.width / 2, //width
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffF25F29),
                                  padding: const EdgeInsets.all(20)),
                               onPressed: () async {
                                if (userNameController.text == '' ||
                                    userPasswordController.text == '') {
                                  snackBarMessage(
                                      context, "Please enter User details");
                                } else {
                                  Login();
                                }

                                //  checkConnection();
                              },
                              child: const Text("Login"))),
                    )),
                const SizedBox(height: 10),
                SizedBox(
                    height: MediaQuery.of(context).size.height /
                        10, //height of button
                    width:
                        MediaQuery.of(context).size.width / 2, //width of button

                    child: TextButton(
                      child: const Text('Forgotten Password?'),
                      onPressed: () {},
                    )),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 10, //height of button
          width: MediaQuery.of(context).size.width / 2.5,

          child: Column(
            children: const [
              Text('2020 | Vikncodes LLP | All Rights Reserved'),
              Text('www.vikncodes.com')
            ],
          ),
        )
      ],
    )));
  }

  // checkConnection() async{
  //
  //
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     snackBarMessage(context, "none");
  //   } else {
  //     Login();
  //   }
  // }
  Future<Null> Login() async {
    start(context);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final url = '$baseUrl/users/user-login/';
        print(url);
        //hereee
        Map data = {
          "username": userNameController.text,
          "password": userPasswordController.text,
          "is_mobile": true

        };
        print(data);
        //encode Map to JSON
        var bdy = json.encode(data);

        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
            },
            body: bdy);

        print("${response.statusCode}");
        print("${response.body}");
        Map n = json.decode(utf8.decode(response.bodyBytes));

        var status = n["success"];
        var responseJson = n["data"];
        print(responseJson);
        if (status == 6000) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            stop();
            prefs.setBool('isLoggedIn', true);
            prefs.setString('access', n["access"]);
            prefs.setInt('user_id', n["user_id"]);
//thiss user id
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CompanyList()),
            );
            var message = n["message"];

            snackBarMessage(context, message);
          });
        } else if (status == 6001) {
          var msg = n["error"];

          snackBarMessage(context, msg);
          stop();
        }

        //DB ErroralertMessage
        else {
          setState(() {
            stop();
            snackBarMessage(context, "Some thing went wrong");
          });
        }
      } catch (e) {
        setState(() {
          snackBarMessage(context, "Some thing went wrong");
          stop();
        });
        print(e);
        print('Error In Loading');
      }
    }
  }
}

// login companylist dash

