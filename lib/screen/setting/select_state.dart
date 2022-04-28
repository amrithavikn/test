
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'settings_page.dart';

class SelectState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
  Future<Null> getStateDetails() async {
    try {
      var countryId = OrganisationCountry.country_id;
       String url = "https://api.viknbooks.com/api/v8/states/country-states/$countryId/";
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
          for (Map user in responseJson) {
            stateDetail.add(StateData.fromJson(user));
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
    stateDetail.clear();
    super.initState();
    getStateDetails();
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
          'Choose a State',
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
                itemCount: stateDetail.length,
                itemBuilder: (context, index) {
                  return Card(
                      child:  ListTile(

                          title: Text(
                            stateDetail[index].stateName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            stateDetail[index].stateType,
                            style: const TextStyle(
                              fontSize: 14, ),
                          ),
                          onTap: () async {


                          OrganisationCountry.state_id =  stateDetail[index].stateID;
                         // print("OrganisationCountry.state_id");
                          print(OrganisationCountry.state_id);

                            Navigator.pop(context,  stateDetail[index].stateName);
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

List<StateData> stateDetail = [];

class StateData {
  final String stateName, stateID,  stateType,countryName,country,countryCode;



  StateData({
    required this.countryName,
    required this.countryCode,
    required this.country,
    required this.stateID,
    required this.stateName,
    required this.stateType,



  });

  factory StateData.fromJson(Map<dynamic, dynamic> json) {
    return StateData(
      countryName: json['Country_Name'],
      countryCode: json['CountryCode'],
       stateType: json['State_Type'],
       stateName: json['Name'],
      stateID: json['id'],
      country: json['Country'],





    );
  }
}
