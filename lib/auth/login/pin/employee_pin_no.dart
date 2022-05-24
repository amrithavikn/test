import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/dashboard/dashboard.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EnterPinNumber extends StatefulWidget {
  const EnterPinNumber({Key? key}) : super(key: key);

  @override
  State<EnterPinNumber> createState() => _EnterPinNumberState();
}

Color c1 = Colors.white;
Color c2 = Colors.white;
Color c3 = Colors.white;
Color c4 = Colors.white;
Color c5 = Colors.white;
Color c6 = Colors.white;

Color c7 = Colors.white;
Color c8 = Colors.white;
Color c9 = Colors.white;
Color c10 = Colors.white;

var passList = [1, 2, 3, 4, 5, 6];
List<int> num = [];

var number = 1;
var ind = 1;

addToList(num) {
  if (num.length < 6) {
    num.add(num);
  }
}

class _EnterPinNumberState extends State<EnterPinNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                height:
                    MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          1.13, //height of button
                      width: MediaQuery.of(context).size.width / 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height /
                                    16, //height of button
                                width: MediaQuery.of(context).size.width / 3,
                                child: const Text(
                                  'Enter PIN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )),
                            passwordEnteringField(),
                            oneToThreeNumbers(),
                            fourToSixNumber(),
                            sevenToNineNumber(), //
                            zeroNumberAndClearButton(),
                          ]),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height /
                          11, //height of button
                      width: MediaQuery.of(context).size.width / 3,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Database: Vikncodes LLP',
                            style: TextStyle(color: Color(0xffE20000)),
                          ),
                          Text(
                              'Registered Under Vikncodes LLP \n (Trial Version)',
                              style: TextStyle(color: Color(0xff003982)),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    )
                  ],
                ))));
  }

  changeColor() {
    setState(() {
      if (num.length == 1) {
        c1 = const Color(0xff000000);
        c2 = Colors.white;
        c3 = Colors.white;
        c4 = Colors.white;
        c5 = Colors.white;
        c6 = Colors.white;
      } else if (num.length == 2) {
        c1 = const Color(0xff000000);
        c2 = const Color(0xff000000);
        c3 = Colors.white;
        c4 = Colors.white;
        c5 = Colors.white;
        c6 = Colors.white;
      } else if (num.length == 3) {
        c1 = const Color(0xff000000);
        c2 = const Color(0xff000000);
        c3 = const Color(0xff000000);
        c4 = Colors.white;
        c5 = Colors.white;
        c6 = Colors.white;
      } else if (num.length == 4) {
        c1 = const Color(0xff000000);
        c2 = const Color(0xff000000);
        c3 = const Color(0xff000000);
        c4 = const Color(0xff000000);
        c5 = Colors.white;
        c6 = Colors.white;
      } else if (num.length == 5) {
        c1 = const Color(0xff000000);
        c2 = const Color(0xff000000);
        c3 = const Color(0xff000000);
        c4 = const Color(0xff000000);
        c5 = const Color(0xff000000);
        c6 = Colors.white;
      } else if (num.length == 6) {
        c1 = const Color(0xff000000);
        c2 = const Color(0xff000000);
        c3 = const Color(0xff000000);
        c4 = const Color(0xff000000);
        c5 = const Color(0xff000000);
        c6 = const Color(0xff000000);
      } else {
        c1 = Colors.white;
        c2 = Colors.white;
        c3 = Colors.white;
        c4 = Colors.white;
        c5 = Colors.white;
        c6 = Colors.white;
      }
      if (num.length == 6) {


        String passData = num.join('');

        getProductCode(passData);
      } else {
        print('length is not 6');
      }
    });
  }



  Widget passwordEnteringField() {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 16, //height of button
      width: MediaQuery.of(context).size.width / 3.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c1,
                border: Border.all(color: const Color(0xff707070))),
            child: const Text(''),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c2,
                border: Border.all(color: const Color(0xff707070))),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c3,
                border: Border.all(color: const Color(0xff707070))),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c4,
                border: Border.all(color: const Color(0xff707070))),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c5,
                border: Border.all(color: const Color(0xff707070))),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 38, //height of button
            width: MediaQuery.of(context).size.width / 38,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c6,
                border: Border.all(color: const Color(0xff707070))),
          ),
        ],
      ),
    );
  }

  Widget oneToThreeNumbers() {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 9,
      padding: const EdgeInsets.all(11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xffFFFFFF),
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(1);
                    changeColor();
                  }
                },
                icon: const Text(
                  '1',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(2);
                    changeColor();
                  }
                },
                icon: const Text(
                  '2',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(3);

                    changeColor();
                  }
                },
                icon: const Text(
                  '3',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }

  Widget fourToSixNumber() {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 9,
      padding: const EdgeInsets.all(11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    if (num.length >= 6) {
                    } else {
                      num.add(4);

                      changeColor();
                    }
                  });
                },
                icon: const Text(
                  '4',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(5);

                    changeColor();
                  }
                },
                icon: const Text(
                  '5',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(6);

                    changeColor();
                  }
                },
                icon: const Text(
                  '6',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }

  Widget sevenToNineNumber() {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 9,
      padding: const EdgeInsets.all(11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  //  passList.add(7);
                  if (num.length >= 6) {
                  } else {
                    num.add(7);

                    changeColor();
                  }
                },
                icon: const Text(
                  '7',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(8);

                    changeColor();
                  }
                },
                icon: const Text(
                  '8',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(9);

                    changeColor();
                  }
                },
                icon: const Text(
                  '9',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }

  Widget zeroNumberAndClearButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 9,
      padding: const EdgeInsets.all(11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(23))),
            child: IconButton(
                onPressed: () {
                  if (num.length >= 6) {
                  } else {
                    num.add(0);

                    changeColor();
                  }
                },
                icon: const Text(
                  '0',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12, //height of button
            width: MediaQuery.of(context).size.width / 17,

            child: IconButton(
              tooltip: 'clear fields',
              onPressed: () {
                setState(() {
                  if (num.isNotEmpty) {
                    num.removeLast();
                    changeColor();
                  } else {}
                });
              },
              icon: SvgPicture.asset('assets/svg/backspace.svg'),
              iconSize: 60,
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> getProductCode(String pin) async {
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

        var companyID = prefs.getString('companyID') ?? '';

        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/validate-user-pin/';
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "PinNo": pin,
        };
        print(data);

        //encode Map to JSON
        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);

        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];
        print(response.body);

        if (status == 6000) {
          setState(() {
            stop();
            prefs.setString('pos_user_id', n["user_id"]);
            prefs.setString('user_name', n["user_name"]);
            prefs.setString('role', n["role"]);
            prefs.setString('role_name', n["role_name"]);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            );
          });
        } else if (status == 6001) {
          print('Please Enter Correct Password');
          stop();
        } else {
          stop();
        }
      } catch (e) {
        setState(() {
          stop();
        });
      }
    }
  }
}

List<PasswordScreenModel> passWordList = [];

class PasswordScreenModel {}
