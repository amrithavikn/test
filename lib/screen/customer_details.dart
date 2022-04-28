import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  //final String title;

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

    TextEditingController _nameController = TextEditingController();
   TextEditingController  _nameSuffixController = TextEditingController();
   TextEditingController  _emailController = TextEditingController();
   TextEditingController  _phoneController = TextEditingController();
   TextEditingController  _addressCityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getProductList();
    });



  }

  Color color1 = Colors.transparent;

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
              'Customers',
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
        body: Row(children: <Widget>[
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height / 1, //height of button
                  width: MediaQuery.of(context).size.width / 2.4,
                  //color: Colors.red[100],
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            10, //height of button
                        width: MediaQuery.of(context).size.width / 1,
                        // color: Colors.blue[100],
                        child: const Text("Add Customer",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            1.45, //height of button
                        width: MediaQuery.of(context).size.width / 1.1,
                        // color: Colors.yellow[100],
                        child: Row(
                          children: [
                            Container(
                              //image
                              padding: const EdgeInsets.all(40.0),
                              height: MediaQuery.of(context).size.height /
                                  1.3, //height of button
                              width: MediaQuery.of(context).size.width / 3.2,
                              // color: Colors.purple[100],
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // SizedBox(height: 30),
                                    SvgPicture.asset('assets/svg/Logo.svg',
                                        fit: BoxFit.fill),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          color1 = Colors.orange;
                                          //color2 = Colors.transparent;
                                        });

                                        final Image? imgName =
                                            await _asyncSimpleDialog(context);
                                      },
                                      child: const Text(
                                        "Upload Image",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          width: 1.0,
                                          color: color1,
                                        ),
                                        primary: Colors.white,
                                      ),
                                    )
                                  ]),
                            ),
                            customerNameAndDetail()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            10, //height of button
                        width: MediaQuery.of(context).size.width / 1,
                        //color: Colors.green[100],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    _addressCityController.clear();
                                    _nameSuffixController.clear();
                                    _nameController.clear();
                                    _emailController.clear();
                                    _phoneController.clear();

                                    return;
                                  }
                                },
                                icon: SvgPicture.asset(
                                  'assets/svg/add.svg',
                                ),
                                iconSize: 40),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/svg/delete.svg',
                                ),
                                iconSize: 40),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
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
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height /
                              20, //height of button
                          width: MediaQuery.of(context).size.width / 2.4,
                          //color: Colors.red[100],
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        customerDetailList()     ,
                        SizedBox(
                          height: MediaQuery.of(context).size.height /
                              10, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          // color: Colors.red[100],
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      print("--------------------");
                                      getProductList();
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/svg/addmore.svg',
                                    ),
                                    iconSize: 40),
                              ]),
                        )
                      ],
                    ),
                  )))
        ]));
  }
  Widget customerNameAndDetail(){
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: ListView(
          children: <Widget>[
            Container(
              padding:  const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text("First Name",
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 13,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20, //height of button

                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization:TextCapitalization.words,
                            minLines: 1,
                            controller: _nameController,
                            autofillHints: const [
                              AutofillHints.name
                            ],
                            decoration:
                            const InputDecoration(
                              isDense: true,
                              border:
                              OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Last Name",
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 13,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20, //height of button

                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization:TextCapitalization.words,
                            controller:
                            _nameSuffixController,
                            autofillHints: const [
                              AutofillHints.nameSuffix
                            ],
                            decoration:
                            const InputDecoration(
                              isDense: true,
                              border:
                              OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Email",
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 13,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20, //height of button

                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType
                                .emailAddress,
                            autofillHints: const [
                              AutofillHints.email
                            ],
                            decoration:
                            const InputDecoration(
                              isDense: true,
                              border:
                              OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              if (!value.contains('@')) {
                                return "A valid email should contain '@'";
                              }
                              if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Phone Number",
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 13,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20, //height of button

                          child: TextFormField(
                            keyboardType:
                            TextInputType.phone,
                            controller: _phoneController,
                            autofillHints: const [
                              AutofillHints
                                  .telephoneNumber
                            ],
                            decoration:
                            const InputDecoration(
                              isDense: true,
                              border:
                              OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              if (value.length != 10) {
                                return 'A valid phone number should be of 10 digits';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Address",
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 13,
                            )),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          textCapitalization:TextCapitalization.words,
                          controller:
                          _addressCityController,
                          autofillHints: const [
                            AutofillHints.addressCity
                          ],
                          maxLines: 4,
                          decoration:
                          const InputDecoration(
                            border:
                            OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
  Widget customerDetailList(){
    return  SizedBox(
      height: MediaQuery.of(context).size.height /
          1.35, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      // color: Colors.purple[100],),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: customerList.length,
          itemExtent: MediaQuery.of(context).size.height/11,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  leading: Container(
                    decoration: const BoxDecoration(

                      shape: BoxShape.rectangle,
                    ),
                    child: SvgPicture.asset(
                        'assets/svg/customer.svg',fit: BoxFit.fill,),
                  ),
                  title:  Text(
                      customerList[index].ledgerName
                      //"<Customer Name>"
                  ),
                  subtitle:   Text(


                   customerList[index].custLedgerBalance
                  ),
                ));
          }),
    );
  }


  Future<Null> getProductList() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    }

    else {
      try {
        print("----------4----------");
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var branchID = BaseUrl.branchID;
        var userID = prefs.getInt("user_id");
        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-ledgerListByID/';
        print(url);

        Map data = {
          "CompanyID": companyID,
           "BranchID": branchID,
           "CreatedUserID": userID,
           "PriceRounding": 2,
           "load_data":true,
           "type_invoice":"SalesInvoice",
           "LedgerName":"",
           "length":"",
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

        print(response.statusCode);

        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];
        var responseJson = n["data"];
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              customerList.add(CustomerDetailModel.fromJson(user));
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

enum Image { gallery, camera }

Future<Image?> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Image>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose a Photo '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Image.gallery);
              },
              child: const Text('Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Image.camera);
              },
              child: const Text('Camera'),
            ),
          ],
        );
      });





}


List<CustomerDetailModel> customerList=[];

class CustomerDetailModel {

  final String ledgerName,custLedgerBalance,openBalance;
  final int ledgerId,   accountGroup;

  CustomerDetailModel({
    required this.ledgerId, required this.ledgerName, required this.openBalance, required this.custLedgerBalance, required this.accountGroup
  });

  factory CustomerDetailModel.fromJson(Map<dynamic, dynamic> json) {
    return CustomerDetailModel(
      ledgerName: json['LedgerName'],
      openBalance: json['OpeningBalance'].toString(),
      custLedgerBalance: json['CustomerLedgerBalance'].toString(),
      accountGroup: json['AccountGroupUnder'],
      ledgerId: json['LedgerID'],

    );
  }
}
