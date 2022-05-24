import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../product_details.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<SelectCategory> {
  @override
  void initState() {
    getCategoryDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // add navigation
            },
          ), //
          title: const Text(
            'Category',
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
          width: MediaQuery.of(context).size.width / 1.1,
          color: Colors.grey[100],
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                      title: Text(categoryLists[index].groupName),
                      onTap: () async {
                        ProductDetail.category_id=categoryLists[index].productGroupId.toString();
                        Navigator.pop(context, categoryLists[index].groupName);
                      },
                    ));
              })),
    );
  }

  Future<Null> getCategoryDetails() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    }

    else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String baseUrl = BaseUrl.bUrl;

        var companyID = prefs.getString('companyID') ?? "0";
        var branchID = BaseUrl.branchID;
        var accessToken = prefs.getString('access') ?? '';
         String url ="$baseUrl/posholds/pos/product-group/list/";
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
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
        var responseJson = n["data"];
        print(status);
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              categoryLists.add(CategoryListModel.fromJson(user));
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



List<CategoryListModel> categoryLists = [];

class CategoryListModel {
  final String categoryId, groupName;
  final int productGroupId;

  CategoryListModel(
      {required this.groupName,
      required this.productGroupId,
      required this.categoryId,
      });

  factory CategoryListModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryListModel(
        groupName: json['GroupName'],
        productGroupId: json['ProductGroupID'],
        categoryId: json['id']);
  }
}
