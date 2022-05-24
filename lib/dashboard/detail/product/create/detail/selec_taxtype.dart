import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../product_details.dart';

class SelectTaxType extends StatefulWidget {
  const SelectTaxType({Key? key}) : super(key: key);

  @override
  State<SelectTaxType> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<SelectTaxType> {
  @override
  void initState() {
    getTaxTypeDetails();
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
            'Tax Type',
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
            itemCount: taxTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                     title: Text(taxTypeList[index].taxName),
                      onTap: () async {
                      //  ProductDetail.category_id=categoryLists[index].categoryGroupId.toString();

                        ProductDetail.taxID=taxTypeList[index].taxId.toString();
                        Navigator.pop(context, taxTypeList[index].taxName);
                      },
                    ));
              })),
    );
  }

  Future<Null> getTaxTypeDetails() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    }

    else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //  var companyID = prefs.getString('companyID') ?? 0;
        var companyID = prefs.getString('companyID') ?? "0";
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/taxCategories/taxListByType/';
       // const String url ="https://api.viknbooks.com/api/v8/taxCategories/taxListByType/";
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "CreatedUserID":userID,
          "TaxType":"2"
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
taxTypeList.clear();
            for (Map user in responseJson) {
              taxTypeList.add(TaxTypeModel.fromJson(user));
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


List<TaxTypeModel> taxTypeList = [];

class TaxTypeModel {

  final String id,taxName,taxType,purchaseTax,salesTax ;
  final int taxId;
  final bool inclusive;

  TaxTypeModel(
      {required this.id,
        required this.taxType,
        required this.salesTax,
        required this.purchaseTax,
        required this.inclusive,
        required this.taxId,
        required this.taxName,


      });

  factory TaxTypeModel.fromJson(Map<dynamic, dynamic> json) {
    return TaxTypeModel(
        taxName: json['TaxName'],
      id: json['id'],
      taxType: json['TaxType'],
      purchaseTax: json['PurchaseTax'],
      salesTax: json['SalesTax'],
      taxId: json['TaxID'],
      inclusive: json['Inclusive'],




        );
  }
}
