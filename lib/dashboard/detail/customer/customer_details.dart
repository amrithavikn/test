import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final fieldText = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void clearText() {
    fieldText.clear();
  }
ScrollController listScrollController=ScrollController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //  productLists.clear();
      //  getLedgerList();
      getCustomerList();
    });
  }

  String customerId = "";
  String custId = "";
  Color color1 = Colors.transparent;
  bool editTextField=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            10, //height of button
                        width: MediaQuery.of(context).size.width / 1,
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset('assets/svg/Logo.svg',
                                        fit: BoxFit.fill),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          color1 = Colors.orange;
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {

                                  if (customerNameController.text==''|| emailController.text=='') {

                                  }
                                  else{
                                    editTextField==true?editCustomer():createCustomer();

                                  }
                                },
                                //
                                icon: SvgPicture.asset(
                                  'assets/svg/add.svg',
                                ),
                                iconSize: 40),
                            IconButton(
                                onPressed: () {
                                  addressController.clear();
                                  lastNameController.clear();
                                  customerNameController.clear();
                                  emailController.clear();
                                  phoneController.clear();

                                },
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
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customerDetailList(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height /
                              10, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
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

  Widget customerNameAndDetail() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: Form(
        key: _formKey,
        child: ListView(

          children: [
            const Text("First Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                )),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                minLines: 1,
                controller: customerNameController,
                autofillHints: const [AutofillHints.name],
                decoration: const InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                )),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                controller: lastNameController,
                autofillHints: const [AutofillHints.nameSuffix],
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  isDense: true,
                  border: OutlineInputBorder(),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                )),
            SizedBox(
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  isDense: true,
                  border: OutlineInputBorder(),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                )),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                autofillHints: const [AutofillHints.telephoneNumber],
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  if (value.length < 8) {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                )),
            TextFormField(
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.words,
              controller: addressController,
              autofillHints: const [AutofillHints.addressCity],
              maxLines: 4,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customerDetailList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.35, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      // color: Colors.purple[100],),
      child: ListView.builder(
        controller: listScrollController,
          shrinkWrap: true,
          itemCount: customerModelList.length,
          itemExtent: MediaQuery.of(context).size.height / 11,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              onLongPress: () {
                _showAlertDialog(customerModelList[index].custId, "");
              },
                  onTap: (){
                    getCustomerDetail(customerModelList[index].custId);
                    CustomerDet.custId=customerModelList[index].custId;

                    editTextField=true;
                  },
              leading: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: SvgPicture.asset(
                  'assets/svg/customer.svg',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(customerModelList[index].firstName
                  //"<Customer Name>"
                  ),
              subtitle: Text(customerModelList[index].phoneNumber),
            ));
          }),
    );
  }

  void _showAlertDialog(id, content) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: AlertDialog(
              title: const Padding(
                padding: EdgeInsets.all(0.5),
                child: Text(
                  "Do you really want to delete",
                  textAlign: TextAlign.center,
                ),
              ),
              content: Text(content),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              actions: <Widget>[
                TextButton(
                    onPressed: ()  => {
                          Navigator.of(context).pop(),
                          deleteCustomer(id, context),
                        },
                    child: const Text(
                      'Ok',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () => {
                          Navigator.of(context).pop(),
                        },
                    child: const Text(
                      'Cancel',
                      style:  TextStyle(color: Colors.black),
                    )),
              ],
            ),
          );
        });
  }


  Future<Null> getCustomerList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var branchID = BaseUrl.branchID;
        var userID = prefs.getInt("user_id");
        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/customer-list/';
      //  const String url =   'http://103.177.224.30:8080/api/v9/posholds/customer-list/';

        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "CreatedUserID": userID,
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
            customerModelList.clear();
            stop();
            for (Map user in responseJson) {
              customerModelList.add(CustomerListModel.fromJson(user));
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

  Future<Null> createCustomer() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/customer-create/';
      //  const String url = "http://103.177.224.30:8080/api/v9/posholds/customer-create/";
        print(url);
        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "PartyImage": "",
          "FirstName": customerNameController.text,
          "LastName": lastNameController.text,
          "PhoneNumber": phoneController.text,
          "Email": emailController.text,
          "Address": addressController.text,
          "customer": ""
        };
        print(data);

        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"]; //6000 status or messege is here

        print(response.body);
        print(status);
        if (status == 6000) {
          setState(() {
            addressController.clear();
            lastNameController.clear();
            customerNameController.clear();
            emailController.clear();
            phoneController.clear();
            customerModelList.clear();
            stop();
            getCustomerList();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {}
      } catch (e) {
        setState(() {
          snackBarMessage(context, "Some thing went wrong");
          stop();
        });
      }
    }
  }

   deleteCustomer(id, BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var accessToken = prefs.getString('access') ?? '';
        var companyID = prefs.getString('companyID') ?? '';
        var branchID = BaseUrl.branchID;
        var userID = prefs.getInt("user_id");
         var custID = id;

        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/delete/customer/$custID/';
       // String url = "http://103.177.224.30:8080/api/v9/posholds/delete/customer/$custID/";
        print(url);
/// data
        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
        };
        print(data);

        var body = json.encode(data);
        var response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $accessToken',
          },body: body
        );
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        print("4");
        var status = n["StatusCode"]; //6000 status or messege is here
        print("5");
        print(response.body);
        print(status);
        if (status == 6000) {
          setState(() {
            customerModelList.clear();
            stop();
            getCustomerList();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {}
      } catch (e) {
        setState(() {
          snackBarMessage(context, "Some thing went wrong");
          stop();
        });
      }
    }
  }

  Future<Null> editCustomer() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var accessToken = prefs.getString('access') ?? '';
        var customerId= CustomerDet.custId;

        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/edit/customer/$customerId/';
        // String url ="http://103.177.224.30:8080/api/v9/posholds/edit/customer/$customerId/";
        print(url);
        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "PartyImage": "",
          "FirstName": customerNameController.text,
          "LastName": lastNameController.text,
          "PhoneNumber": phoneController.text,
          "Email": emailController.text,
          "Address": addressController.text,
          "customer": ""
        };
        print(data);

        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"]; //6000 status or messege is here

        print(response.body);
        print(status);
        if (status == 6000) {
          setState(() {
            addressController.clear();
            lastNameController.clear();
            customerNameController.clear();
            emailController.clear();
            phoneController.clear();
            customerModelList.clear();
            stop();
            getCustomerList();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {}
      } catch (e) {
        setState(() {
          snackBarMessage(context, "Some thing went wrong");
          stop();
        });
      }
    }
  }

  Future<Null> getCustomerDetail(id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt("user_id");
        var cID=id;
        var accessToken = prefs.getString('access') ?? '';
        String url = "http://103.177.224.30:8080/api/v9/posholds/single/customer/$cID/";
        print(url);
        Map data = {
          "CompanyID": companyID,
          "CreatedUserID": userID,
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
        print(status);
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();
           addressController.text=responseJson['Address1'] ?? '';
           phoneController.text=responseJson['PhoneNumber'] ?? '';
           customerNameController.text=responseJson['FirstName'] ?? '';
           emailController.text=responseJson['Email'] ?? '';
           lastNameController.text=responseJson['LastName'] ?? '';
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


List<CustomerListModel> customerModelList = [];

class CustomerListModel {
  final String custId, firstName, lastName, phoneNumber, email, address;

  CustomerListModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.phoneNumber,
      required this.custId});

  factory CustomerListModel.fromJson(Map<dynamic, dynamic> json) {
    return CustomerListModel(
      custId: json['id'],
      firstName: json['FirstName'],
      phoneNumber: json['PhoneNumber'],
      lastName: json['LastName'],
      address: json['Address1'],
      email: json['Email'],
    );
  }
}

List<CustomerData> customerData = [];

class CustomerData {
  final String id,firstName,lastName,phoneNumber,email,address;
  CustomerData({
    required this.id,required this.phoneNumber,required this.firstName,
    required this.address,required this.email,required this.lastName
});

  factory CustomerData.fromJson(Map<dynamic, dynamic> json) {
    return CustomerData(
      id: json['id'],
      address: json['Address1'],
      phoneNumber: json['PhoneNumber'],
      email: json['Email'],
      lastName: json['LastName'],
      firstName: json['FirstName'],
    );
  }

}
class CustomerDet{
  static String custId="";
}