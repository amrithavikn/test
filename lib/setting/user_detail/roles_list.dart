import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../settings_page.dart';


class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  State<SelectRole> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<SelectRole> {
  @override
  void initState() {
    getUsersListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ), //
          title: const Text(
            'Select Role',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          backgroundColor: Colors.grey[300],
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                onPressed: () {}),
          ]),
      body: Container(
          height:
          MediaQuery.of(context).size.height / 1, //height of button
          width: MediaQuery.of(context).size.width / 1,
          color: Colors.grey[100],
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: rolesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                      title: Text(rolesList[index].roleName),
                      onTap: () async {
                        print(rolesList[index].id);
                       // ProductDetail.taxID=taxTypeList[index].taxId.toString();

                        UserDetails.role_id=rolesList[index].id;
                        Navigator.pop(context, rolesList[index].roleName);
                      },
                    ));
              })),
    );
  }

  Future<Null> getUsersListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? "0";
        var branchID = BaseUrl.branchID;
        var userID = prefs.getInt("user_id");


        var accessToken = prefs.getString('access') ?? '';

        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/list/pos-role/';
      //  const String url = 'https://api.viknbooks.com/api/v9/posholds/list/pos-role/';
        print(url);
        Map data = {"CompanyID": companyID, "BranchID": branchID,  "CreatedUserID":userID,     };

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
        print(status);
        var responseJson = n["data"];

        if (status == 6000) {
          setState(() {
            rolesList.clear();
            stop();
            for (Map user in responseJson) {
              rolesList.add(RoleListDataModel.fromJson(user));
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


List<RoleListDataModel> rolesList=[];

class RoleListDataModel{
  String id,roleName;
  bool showDining,showTakeAway,showOnline,showCar,showKitchen;
  RoleListDataModel({
    required this.id,required this.roleName,required this.showCar,required this.showDining,required this.showKitchen,required this.showOnline,required this.showTakeAway
  });

  factory RoleListDataModel.fromJson(Map<dynamic, dynamic> json) {
    return RoleListDataModel(
        id: json['id'],
        roleName: json['RoleName'],
        showDining: json['show_dining'],
        showKitchen: json['show_kitchen'],
        showCar: json['show_car'],
        showOnline: json['show_online'],
        showTakeAway: json['show_take_away']
    );
  }}


























// ProductDetail.taxID=taxTypeList[index].taxId.toString();
// Navigator.pop(context, taxTypeList[index].taxName);