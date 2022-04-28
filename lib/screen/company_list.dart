import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:rassasy_tab/screen/employee_pin_no.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompanyListState();
}


class CompanyListState extends State<CompanyList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width / 2.3,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(

                              width: MediaQuery.of(context).size.width / 2,
                                 height: MediaQuery.of(context).size.height / 16,
                              child:Row(
                                children:  [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      bottom: 7,
                                    ),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "Company",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),

                            searchCompany()  ,
                            displayCompanyList()  ,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            10, //height of button
                        width: MediaQuery.of(context).size.width / 2,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('2020 | Vikncodes LLP | All Rights Reserved'),
                            Text('www.vikncodes.com')
                          ],
                        ),
                      )
                    ]))
          ]),
    ));
  }

  Widget searchCompany(){
    return SizedBox(

      width: MediaQuery.of(context).size.width / 2,

      height: MediaQuery.of(context).size.height / 14,
      child: const TextField(
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
          ),

        ),
      ),
    );
  }
Widget displayCompanyList(){
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2.1,
      child: ListView.builder(
          itemCount: companyList.length,
          itemBuilder:   (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  onTap: () async {
                    SharedPreferences prefs=await SharedPreferences.getInstance();
                    prefs.setString('companyName', companyList[index].companyName);
                    prefs.setString('companyType', companyList[index].companyType);
                    prefs.setString('expiryDate', companyList[index].expiryDate);
                    prefs.setString('permission', companyList[index].permission);
                    prefs.setString('edition',companyList[index].permission);
                    prefs.setBool('isPosUser', companyList[index].isPosUser);
                    prefs.setString('companyID', companyList[index].id);
                    prefs.setBool('companySelected', true);



                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const EnterPinNumber()));

                  },


                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(companyList[index].companyName,
                        style: const TextStyle(fontSize: 17,color: Colors.black),),
                      Text(companyList[index].companyType,
                          style: const TextStyle(fontSize: 12,color: Colors.black)),
                    ],
                  ),
                  subtitle: Text(companyList[index].edition,
                      style: const TextStyle(fontSize: 12,color: Colors.black)),

                ));
          }),
    );
}
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero, () {
      getCompanyListDetails();
    });

  }


  Future<Null> getCompanyListDetails() async {
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
        var userID = prefs.getInt('user_id') ?? 0;
        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-companies/';


        Map data = {"userId": userID};
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
        var responseJson = n["data"];
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              companyList.add(CompanyListDataModel.fromJson(user));
            }
          });

        } else if (status == 6001) {
          stop();
          var msg = n["error"];
          snackBarMessage(context, msg);
        }
        //DB Error
        else {
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


List<CompanyListDataModel> companyList=[];

class CompanyListDataModel {
final bool isPosUser;
final String id,companyName,companyType,expiryDate,permission,edition;

CompanyListDataModel({required this.id,required this.companyType,required this.companyName,required this.isPosUser,required this.edition,required this.expiryDate,required this.permission});



factory CompanyListDataModel.fromJson(Map<dynamic,dynamic> json){
  return  CompanyListDataModel(
    id: json['id'],
    permission: json['Permission'],
    companyType: json['company_type'],
    edition: json['Edition'],
    expiryDate: json['ExpiryDate'],
    companyName: json['CompanyName'],
    isPosUser: json['IsPosUser'],
  );
}
 }



