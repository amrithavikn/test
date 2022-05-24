import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductGroup extends StatefulWidget {
  const ProductGroup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductGroupState();
}

class ProductGroupState extends State<ProductGroup> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  FocusNode productName = FocusNode();
  FocusNode description = FocusNode();
  FocusNode saveIcon = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                    // add navigation
                  },
                ), //
                title: const Text(
                  'Product Group',
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
                      onPressed: () async {
                        //thiss user id
                      }),
                ]),
            body: Row(children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.grey[100],
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                addProductGroup()  ,
                                addAndDelete()
                          ]))),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height /
                              1, //height of button
                          width: MediaQuery.of(context).size.width / 2.4,
                          color: Colors.grey[100],
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      19, //height of button
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: const TextField(

                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                displayProductGroupList() ,
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      8, //height of button
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                              'assets/svg/addmore.svg',
                                            ),
                                            iconSize: 40),
                                      ]),
                                )
                              ]))))
            ])));
  }
  Widget addProductGroup(){
    return  SizedBox(
        height: MediaQuery.of(context).size.height /
            2, //height of button
        width: MediaQuery.of(context).size.width / 2.4,
        //color: Colors.white,
        child: Center(
            child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            "Add Product Group",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          TextField(
                            focusNode: productName,
                            controller:
                            productNameController,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(
                                  description);
                            },
                            decoration:
                            const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Description",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextField(
                            focusNode: description,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(saveIcon);
                            },
                            controller:
                            descriptionController,
                            maxLines: 4,
                            decoration:
                            const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ]),
                  )
                ])));
  }
  Widget addAndDelete(){
    return  SizedBox(
      height: MediaQuery.of(context).size.height /
          2.5, //height of button
      width: MediaQuery.of(context).size.width / 1.5,
      //   color: Colors.blue[100],

      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        //   mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/delete.svg',
              ),
              iconSize: 40),
          IconButton(
              onPressed: () async {
                if (productNameController.text == '') {
                  snackBarMessage(context,
                      "Please enter product name");
                } else {
                  start(context);
                  addProductGroupApi();
                }
              },
              icon: SvgPicture.asset(
                  'assets/svg/add.svg'),
              focusNode: saveIcon,
              iconSize: 40)
        ],
      ),
    );
  }
Widget displayProductGroupList(){
    return SizedBox(
      height: MediaQuery.of(context).size.height /
          1.41, //height of button
      width:
      MediaQuery.of(context).size.width / 2.4,

      child: ListView.builder(
          shrinkWrap: true,
          itemCount: productLists.length,
          itemBuilder:
              (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  title: Text(//"<Product Group>",

                      productLists[index].groupName),

                  //  subtitle: Text('Kerala'),
                ));
          }),
    );
}
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      productLists.clear();
      getProductListDetails();
    });
  }

  Future<Null> getProductListDetails() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    }

    else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? 0;
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos/product-group/list/';

        Map data = {"CompanyID": companyID, "BranchID": branchID};


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
              productLists.add(ProductListModel.fromJson(user));
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

  Future<Null> addProductGroupApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    }
    else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var categoryID = 1;
        var accessToken = prefs.getString('access') ?? '';


        final String url = "$baseUrl/productGroups/create-productGroup/";
        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "CategoryID": categoryID,
          "IsActive": true,
          "GroupName": productNameController.text,
          "Notes": descriptionController.text,
        };


        //encode Map to JSON
        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);


        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"]; //6000 status or messege is here
        var responseJson = n["data"];
        if (status == 6000) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          setState(() {
            stop();
            productNameController.clear();
            descriptionController.clear();
            productLists.clear();
            getProductListDetails();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
        } else {

        }
      } catch (e) {
        setState(() {
          //snackBarMessage(context, "Some thing went wrong");
          stop();
        });

      }
    }
  }
}

List<ProductListModel> productLists = [];

class ProductListModel {
  final String productId, groupName;
  final int productGroupId;

  ProductListModel(
      {required this.groupName,
      required this.productGroupId,
      required this.productId});

  factory ProductListModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductListModel(
        groupName: json['GroupName'],
        productGroupId: json['ProductGroupID'],
        productId: json['id']);
  }
}
