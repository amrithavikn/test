import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'settings_page.dart';

class SelectCountry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  Future<Null> getCountryDetails() async {
    try {

      const String url = "https://www.erp.vikncodes.com/api/v8/countries/countries/";
      print(url);

      //encode Map to JSON
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      print("${response.statusCode}");
      print("${response.body}");

      Map n = json.decode(response.body);
      var status = n["StatusCode"];

      var responseJson = n["data"];
      print(responseJson);
      var message = n["message"];

      if (status == 6000) {
        setState(() {
          for (Map aq in responseJson) {
            _countryDetails.add(CountryData.fromJson(aq));
          }
        });
      } else if (status == 6001) {
      }

      //DB Error
      else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _countryDetails.clear();
    super.initState();
    getCountryDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff3f3f3),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black)),
        title: const Text(
          'Choose a Country',
          style: TextStyle( fontSize: 17,color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),color: Colors.black)
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              height:
              MediaQuery.of(context).size.height / 1.1, //height of button
              width: MediaQuery.of(context).size.width / 1,
              child: ListView.builder(
                itemExtent: MediaQuery.of(context).size.height / 14,
                itemCount: _countryDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    child:  ListTile(

                          title: Text(
                            _countryDetails[index].countryName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            _countryDetails[index].taxtype,
                            style: const TextStyle(
                              fontSize: 14, ),
                          ),
                          onTap: () async {


                            OrganisationCountry.country_id =  _countryDetails[index].countryID;

                            Navigator.pop(context,  _countryDetails[index].countryName);
                          })
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<CountryData> _countryDetails = [];

class CountryData {
  final String countryName, countryID, countryCode, isdCode,currencyName,change,symbol,fractionUnit,symbolUnicode,taxtype;



  CountryData({required this.countryID,
        required this.countryName,
        required this.countryCode,
        required this.isdCode,
    required this.currencyName,
    required this.change,
    required this.symbol,
    required this.fractionUnit,
    required this.symbolUnicode,
    required this.taxtype,


  });

  factory CountryData.fromJson(Map<dynamic, dynamic> json) {
    return CountryData(
        countryName: json['Country_Name'],
        countryID: json['id'],
        countryCode: json['CountryCode'],
        isdCode: json['ISD_Code'],
        fractionUnit: json['FractionalUnits'],
      change: json['Change'],
      taxtype: json['Tax_Type'],
      symbolUnicode: json['CurrencySymbolUnicode'],
      currencyName: json['Currency_Name'],
      symbol: json['Symbol'],





    );
  }
}
