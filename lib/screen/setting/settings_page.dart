import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:rassasy_tab/login.dart';
import 'package:rassasy_tab/screen/setting/select_country.dart';
import 'package:rassasy_tab/screen/setting/select_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  start(BuildContext context) {
    Loader.show(context,
        progressIndicator: const CircularProgressIndicator(),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff02BAB7))),
        overlayColor: const Color(0x99E8EAF6));
  }

  stop() {
    Future.delayed(const Duration(seconds: 0), () {
      Loader.hide();
    });
  }

  bool switchControl = false;
  bool switchControl1 = false;
  bool status = false;
  bool switch1 = false;
  bool diningSwitch = false;
  bool takeSwitch = false;
  bool carSwitch = false;
  bool onlineSwitch = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;
  var printer = 1;
  var kitchen = 1;
  var index = 0;
  var user = 1;
  var organization = 1;
  bool paymentMethod = false;
  bool addPrinter = false;
  bool printKitchen = true;

  Color colors1 = Colors.white;
  Color colors2 = Colors.green;
  Color c2 = Colors.green;
  Color c1 = Colors.white;
  Color c3 = Colors.white;
  Color setting1 = Colors.white;
  Color setting2 = const Color(0xffF3F3F3);
  Color setting3 = const Color(0xffF3F3F3);
  Color setting4 = const Color(0xffF3F3F3);
  Color setting5 = const Color(0xffF3F3F3);
  Color setting6 = const Color(0xffF3F3F3);
  Color setting7 = const Color(0xffF3F3F3);
  Color setting8 = const Color(0xffF3F3F3);
  Color setting9 = const Color(0xffF3F3F3);
  Color setting10 = const Color(0xffF3F3F3);
  Color setting11 = const Color(0xffF3F3F3);
  Color borderColor1 = Colors.transparent;
  Color borderColor2 = Colors.orange;

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  final _formKey = GlobalKey<FormState>();
  late FocusNode ipAddress1 = FocusNode();
  late FocusNode ipAddress2 = FocusNode();
  late FocusNode ipAddress3 = FocusNode();
  late FocusNode ipAddress4 = FocusNode();
  late FocusNode printerName = FocusNode();
  late FocusNode saveIcon = FocusNode();
  late FocusNode usersName = FocusNode();

  late FocusNode organizationName = FocusNode();
  late FocusNode organizationRegNo = FocusNode();
  late FocusNode financialYear1 = FocusNode();
  late FocusNode financialYear2 = FocusNode();
  late FocusNode organizationEmail = FocusNode();
  late FocusNode organizationPhone = FocusNode();
  late FocusNode organizationPAN = FocusNode();
  late FocusNode organizationGST = FocusNode();
  late FocusNode organizationTDS = FocusNode();
  late FocusNode organizationBuildingNo = FocusNode();
  late FocusNode organizationLandMark = FocusNode();
  late FocusNode organizationCountry = FocusNode();
  late FocusNode organizationCity = FocusNode();
  late FocusNode organizationState = FocusNode();
  late FocusNode organizationPIN = FocusNode();

  TextEditingController printerNameController = TextEditingController();
  TextEditingController ipAddressController1 = TextEditingController();
  TextEditingController ipAddressController2 = TextEditingController();
  TextEditingController ipAddressController3 = TextEditingController();
  TextEditingController ipAddressController4 = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController organizationRegNoController = TextEditingController();
  TextEditingController financialYear1Controller = TextEditingController();
  TextEditingController financialYear2Controller = TextEditingController();
  TextEditingController organizationEmailController = TextEditingController();
  TextEditingController organizationPhoneController = TextEditingController();
  TextEditingController organizationPANController = TextEditingController();
  TextEditingController organizationGSTController = TextEditingController();
  TextEditingController organizationTDSController = TextEditingController();
  TextEditingController organizationBuildingNoController =
      TextEditingController();
  TextEditingController organizationLandMarkController =
      TextEditingController();
  TextEditingController organizationCountryController = TextEditingController();
  TextEditingController organizationCityController = TextEditingController();
  TextEditingController organizationStateController = TextEditingController();
  TextEditingController organizationPINController = TextEditingController();
  TextEditingController kitchenNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var selectedCountry = "India";
  var taxType = "GST";
  String orgCountryId="";


  @override
  void initState() {
    super.initState();

    setState(() {
      super.initState();
      OrganisationCountry.country_id = "30f8c506-e27a-476c-8950-b40a6461bf61";
      OrganisationCountry.state_id = "19b4fb50-6882-4d29-81cc-0591191f25e6";
    });
    // kitchenList.clear();
    getKitchenListApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  },
                ),
                title: const Text(
                  'Settings',
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[settingsDetailScreens(index)],
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: selectSettingsList()))
            ])));
  }

  settingsDetailScreens(int index) {
    if (index == 1) {
      return generalSettingScreen();
    } else if (index == 2) {
      return printerSettingScreen();
    } else if (index == 3) {
      return kitchenSettingScreen();
    } else if (index == 4) {
      return organizationSettingScreen();
    } else if (index == 5) {
      return usersSettingScreen();
    } else if (index == 6) {
      return contactUSScreen();
    } else if (index == 7) {
      return privacyPoliciesScreen();
    } else if (index == 8) {
      return termsAndConditionScreen();
    } else if (index == 9) {
      return versionDetailScreen();
    } else if (index == 10) {
      return languagesScreen();
    } else {
      return generalSettingScreen();
    }
  }

  Widget selectSettingsList() {
    return ListView(children: <Widget>[
      Card(
        color: setting1,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 1;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/genrlsetting.svg')),
          title: const Text('General Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 2;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/printseting.svg')),
          title: const Text('Printer Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting3,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 3;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/kitchenseting.svg')),
          title: const Text('Kitchen Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting4,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 4;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/organisation.svg')),
          title: const Text('Organizations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 5;
              test(index);
            });
          },
          // onTap: (),
          leading: IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/svg/users.svg')),
          title: const Text('Users',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting6,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 6;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/Contactus.svg')),
          title: const Text('Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting7,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 7;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/Privacypolicy.svg')),
          title: const Text('Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting8,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 8;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/Termscontitions.svg')),
          title: const Text('Terms And Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting9,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 9;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/Versiondetails.svg')),
          title: const Text('Version Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting10,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              index = 10;
              test(index);
            });
          },
          leading: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: SvgPicture.asset('assets/svg/language.svg')),
          title: const Text('Language',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting11,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () async {
            ConfirmAction? action = await _asyncConfirmDialog(context);
            if (action == ConfirmAction.accept) {
              navigateUser();
            } else {}
          },
          leading: IconButton(
              onPressed: () async {},
              icon: SvgPicture.asset('assets/svg/logout.svg')),
          title: const Text('Log Out',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    ]);
  }

  test(int ind) {
    setState(() {
      if (ind == 1) {
        setting1 = Colors.white;
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 2) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = Colors.white;
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 3) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = Colors.white;
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 4) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = Colors.white;
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 5) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = Colors.white;
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 6) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = Colors.white;
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 7) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = Colors.white;
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 8) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = Colors.white;
        setting9 = const Color(0xffF3F3F3);
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 9) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = Colors.white;
        setting10 = const Color(0xffF3F3F3);
      } else if (ind == 10) {
        setting1 = const Color(0xffF3F3F3);
        setting2 = const Color(0xffF3F3F3);
        setting3 = const Color(0xffF3F3F3);
        setting4 = const Color(0xffF3F3F3);
        setting5 = const Color(0xffF3F3F3);
        setting6 = const Color(0xffF3F3F3);
        setting7 = const Color(0xffF3F3F3);
        setting8 = const Color(0xffF3F3F3);
        setting9 = const Color(0xffF3F3F3);
        setting10 = Colors.white;
      } else if (ind == 11) {
        setting11 = Colors.white;
      }
    });
  }

  Widget generalSettingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('General Settings',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          // color: Colors.red[100],
          child: ListView(children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Quantity Increment'),
                trailing: SizedBox(
                  width: 100,
                  child: Center(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 20.0,
                      valueFontSize: 30.0,
                      toggleSize: 15.0,
                      value: switch1,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,
                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          switch1 = val;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                  title: const Text('Show Invoice'),
                  trailing: SizedBox(
                    width: 100,
                    child: Center(
                      child: FlutterSwitch(
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 30.0,
                        toggleSize: 15.0,
                        value: switch2,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        inactiveTextColor: Colors.white,
                        inactiveColor: Colors.grey,

                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            switch2 = val;
                          });
                        },
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      paymentMethod = false;
                    });
                  }),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                  title: const Text('Clear Table After Payment'),
                  trailing: SizedBox(
                    width: 100,
                    child: Center(
                      child: FlutterSwitch(
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 30.0,
                        toggleSize: 15.0,
                        value: switch3,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        inactiveTextColor: Colors.white,
                        inactiveColor: Colors.grey,

                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            switch3 = val;
                          });
                        },
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      paymentMethod = false;
                    });
                  }),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Default Payment Method'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/arrow.svg'),
                ),
                onTap: () {
                  setState(() {
                    paymentMethod = true;
                  });
                },
              ),
            ),
            paymentMethod == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            16, //height of button
                        width: MediaQuery.of(context).size.width / 1,
                        // color: Colors.green[100],
                        child: const Text('Payment Method',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ),
                      SizedBox(
                        //height of button
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 6,

                        child: ListView(children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xffDFDFDF), width: 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            color: Colors.grey[100],
                            child: ListTile(
                              title: const Text('Cash'),
                              trailing: GestureDetector(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colors1,
                                      border: Border.all(color: Colors.grey)),
                                ),
                                onTap: () {
                                  setState(() {
                                    colors1 = Colors.green;
                                    colors2 = Colors.white;
                                  });
                                },
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xffDFDFDF), width: 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            color: Colors.grey[100],
                            child: ListTile(
                              title: const Text('Bank'),
                              trailing: GestureDetector(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colors2,
                                      border: Border.all(color: Colors.grey)),
                                ),
                                onTap: () {
                                  setState(() {
                                    colors2 = Colors.green;
                                    colors1 = Colors.white;
                                  });
                                },
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  )
                : Container(),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Print After Payment'),
                trailing: SizedBox(
                  width: 100,
                  child: Center(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 20.0,
                      valueFontSize: 30.0,
                      toggleSize: 15.0,
                      value: switch4,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,

                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          switch4 = val;
                        });
                      },
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    paymentMethod = false;
                  });
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Pay After Save'),
                trailing: SizedBox(
                  width: 100,
                  child: Center(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 20.0,
                      valueFontSize: 30.0,
                      toggleSize: 15.0,
                      value: switch5,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,

                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          switch5 = val;
                        });
                      },
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    paymentMethod = false;
                  });
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Print Preview'),
                trailing: SizedBox(
                  width: 100,
                  child: Center(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 20.0,
                      valueFontSize: 30.0,
                      toggleSize: 15.0,
                      value: switch6,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,
                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          switch6 = val;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('Customize Print'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/arrow.svg'),
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }

  Widget printerSettingScreen() {
    return Container(child: selectPrintScreen(printer));
  }

  selectPrintScreen(print) {
    if (print == 1) {
      return printerSelectScreen();
    } else if (print == 2) {
      return addPrinterScreen();
    }
  }

  Widget printerSelectScreen() {
    //PRINTER SETTING PAGE
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('Printer Settings',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        //here we want to chanage the container when we click icon button

        SizedBox(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,

          child: ListView(children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/wifi.svg'),
                ),
                title: const Text('<Wifi Printer>'),
                trailing: GestureDetector(
                  child: Container(
                    width: 20,
                    height: 20,
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c1,
                        border: Border.all(color: Colors.grey)),
                  ),
                  onTap: () {
                    setState(() {
                      c1 = Colors.green;
                      c2 = Colors.white;
                      c3 = Colors.white;
                    });
                  },
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/usb.svg'),
                ),
                title: const Text('<Usb Printer>'),
                trailing: GestureDetector(
                  child: Container(
                    width: 20,
                    height: 20,
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c2,
                        border: Border.all(color: Colors.grey)),
                  ),
                  onTap: () {
                    setState(() {
                      c1 = Colors.white;
                      c2 = Colors.green;
                      c3 = Colors.white;
                    });
                  },
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/bluetooth.svg'),
                ),
                title: const Text('<Bluetooth Printer>'),
                trailing: GestureDetector(
                  child: Container(
                    width: 20,
                    height: 20,
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c3,
                        border: Border.all(color: Colors.grey)),
                  ),
                  onTap: () {
                    setState(() {
                      c1 = Colors.white;
                      c2 = Colors.white;
                      c3 = Colors.green;
                    });
                  },
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 15, //height of button
            width: MediaQuery.of(context).size.width / 1,
            //  color: Colors.red[100],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      printer = 2;
                    });
                  },
                  icon: SvgPicture.asset('assets/svg/addmore.svg'),
                  iconSize: 40,
                )
              ],
            )),
      ],
    );
  }

  Widget addPrinterScreen() {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Add Printer',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 1.40, //height of button
        width: MediaQuery.of(context).size.width / 1.1,

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).size.height / 9, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
//color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Printer Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      focusNode: printerName,
                      controller: printerNameController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(ipAddress1);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          //allow upper and lower case alphabets and space
                          return "Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height / 7, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ip Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    //heree updationnn
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 10,
                      //  color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // validationn
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 14,
                            child: TextFormField(
                              focusNode: ipAddress1,
                              controller: ipAddressController1,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(ipAddress2);
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                        .hasMatch(value)) {
                                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                                  return "Enter Correct Phone Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 28,
                            height: MediaQuery.of(context).size.height / 16,
                            alignment: Alignment.center,
                            child: const Text(
                              '.',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 14,
                            child: TextFormField(
                              focusNode: ipAddress2,
                              controller: ipAddressController2,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(ipAddress3);
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                        .hasMatch(value)) {
                                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                                  return "Enter Correct Phone Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 28,
                            height: MediaQuery.of(context).size.height / 16,
                            child: const Text(
                              '.',
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 16,
                            child: TextFormField(
                              focusNode: ipAddress3,
                              controller: ipAddressController3,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(ipAddress4);
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                        .hasMatch(value)) {
                                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                                  return "Enter Correct Phone Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 28,
                            height: MediaQuery.of(context).size.height / 16,
                            // color: Colors.red,
                            child: const Text(
                              '.',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 16,
                            child: TextFormField(
                              focusNode: ipAddress4,
                              controller: ipAddressController4,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(saveIcon);
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                        .hasMatch(value)) {
                                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                                  return "Enter Correct Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        // color: Colors.green,
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    // printerNameController.clear();
                    // ipAdressControler1.clear();
                    // ipAdressControler2.clear();
                    // ipAdressControler3.clear();
                    // ipAdressControler4.clear();

                    return;
                  }
                },
                icon: SvgPicture.asset(
                  'assets/svg/add.svg',
                ),
                iconSize: 40,
                focusNode: saveIcon,
              ),
              IconButton(
                onPressed: () {
                  ipAddressController1.clear();
                  ipAddressController2.clear();
                  ipAddressController3.clear();
                  ipAddressController4.clear();
                  printerNameController.clear();
                },
                icon: SvgPicture.asset('assets/svg/delete.svg'),
                iconSize: 40,
              )
            ]),
      )
    ]);
  }

  Widget kitchenSettingScreen() {
    return Container(
      child: selectKitchenSetting(kitchen),
    );
  }

  selectKitchenSetting(int kitchen) {
    if (kitchen == 1) {
      return kitchenListDisplayScreen();
    } else if (kitchen == 2) {
      return addKitchenScreen();
    }
  }

  Widget kitchenListDisplayScreen() {
    //kitchen settings page
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //color: Colors.blue,
          child: const Text('Kitchen settings',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
            height:
                MediaQuery.of(context).size.height / 1.39, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: kitchenList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        title: Text(kitchenList[index].kitchenName),
                      ));
                })),
        SizedBox(
          height: MediaQuery.of(context).size.height / 14, //height of button
          width: MediaQuery.of(context).size.width / 1,
          // color: Colors.red
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    kitchen = 2;
                  });
                },
                icon: SvgPicture.asset('assets/svg/addmore.svg'),
                iconSize: 50,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget addKitchenScreen() {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Add Kitchen',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 1.40, //height of button
        width: MediaQuery.of(context).size.width / 1.1,
        // color: Colors.red[100],
        child: Column(
          children: [
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 1.40, //height of button
              width: MediaQuery.of(context).size.width /
                  1.1, //color: Colors.red[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        20, //height of button

                    child: TextField(
                      controller: kitchenNameController,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: descriptionController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kitchen Print',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        width: 100,
                        child: FlutterSwitch(
                          width: 40.0,
                          height: 20.0,
                          valueFontSize: 30.0,
                          toggleSize: 15.0,
                          value: switch1,
                          borderRadius: 20.0,
                          padding: 1.0,
                          activeColor: Colors.green,
                          activeTextColor: Colors.green,
                          inactiveTextColor: Colors.white,
                          inactiveColor: Colors.grey,
                          onToggle: (val) {
                            setState(() {
                              switch1 = val;
                              // printKitchen == true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  switch1 == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  4, //height of button
                              width: MediaQuery.of(context).size.width / 1.1,

                              child: ListView(children: <Widget>[
                                Card(
                                  color: Colors.grey[100],
                                  child: ListTile(
                                    leading: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/svg/wifi.svg'),
                                    ),
                                    title: const Text('<Wifi Printer>'),
                                    trailing: GestureDetector(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: c1,
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          c1 = Colors.green;
                                          c2 = Colors.white;
                                          c3 = Colors.white;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.grey[100],
                                  child: ListTile(
                                    leading: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/svg/usb.svg'),
                                    ),
                                    title: const Text('<Usb Printer>'),
                                    trailing: GestureDetector(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: c2,
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          c1 = Colors.white;
                                          c2 = Colors.green;
                                          c3 = Colors.white;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.grey[100],
                                  child: ListTile(
                                    leading: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/svg/bluetooth.svg'),
                                    ),
                                    title: const Text('<Bluetooth Printer>'),
                                    trailing: GestureDetector(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: c3,
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          c1 = Colors.white;
                                          c2 = Colors.white;
                                          c3 = Colors.green;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () async {
                if (kitchenNameController.text == '') {
                  snackBarMessage(context, "Please enter kitchen name");
                } else {
                  start(context);

                  //   kitchenList.clear();
                  createKitchenApi();
                  //

                }
              },
              icon: SvgPicture.asset(
                'assets/svg/add.svg',
              ),
              iconSize: 40),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/delete.svg'),
            iconSize: 40,
          )
        ]),
      )
    ]);
  }

  Widget organizationSettingScreen() {
    return Container(
      child: selectOrganizationScreen(organization),
    );
  }

  selectOrganizationScreen(int organization) {
    if (organization == 1) {
      return organizationListScreen();
    } else if (organization == 2) {
      return createOrganizationScreen();
    }
  }

  Widget organizationListScreen() {
    return Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 16, //height of button
              width: MediaQuery.of(context).size.width / 1,
              //  color: Colors.red[100],
              child: const Text('Organization',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 1.40, //height of button
              width: MediaQuery.of(context).size.width / 1.1,
              // color: Colors.red[100],
              // herr
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.grey, width: .5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ListTile(
                          leading: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/svg/Logo.svg')),
                          title: const Text("Company Name "),
                          subtitle: const Text('Place'),
                          trailing: Container(
                            margin: const EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.orange),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/svg/arrow.svg'),
                              iconSize: 40,
                            ),
                          ),
                        ));
                  }),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 16, //height of button
              width: MediaQuery.of(context).size.width / 1,
              //color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        organization = 2;
                      });
                    },
                    icon: SvgPicture.asset('assets/svg/addmore.svg'),
                    iconSize: 50,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget createOrganizationScreen() {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Create Organization',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      SizedBox(
        //padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 4, //height of button
        width: MediaQuery.of(context).size.width / 1,
        //  color: Colors.red[100],
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 8,
              //color: Colors.white,
              height: MediaQuery.of(context).size.height / 6,
              child: SvgPicture.asset('assets/svg/Logo.svg'),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 2.7,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        borderColor1 = Colors.orange;
                        borderColor2 = Colors.transparent;
                      });

                      final Image? imgName = await _asyncSimpleDialog(context);
                    },
                    child: const Text(
                      "Upload Logo",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: borderColor1,
                        width: 1.0,
                        //   color: color1,
                      ),
                      primary: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Name', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    focusNode: organizationName,
                    controller: organizationNameController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationRegNo);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Registration No.',
                      style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    focusNode: organizationRegNo,
                    controller: organizationRegNoController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(financialYear1);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height / 1.8, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //color: Colors.red

          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(8),
              height:
                  MediaQuery.of(context).size.height / 1.6, //height of button
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Financial year', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 9,
                          child: TextField(
                            focusNode: financialYear1,
                            controller: financialYear1Controller,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(financialYear2);
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 9,
                          child: TextField(
                            focusNode: financialYear2,
                            controller: financialYear2Controller,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(organizationEmail);
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Email', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationEmail,
                    controller: organizationEmailController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationPhone);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Phone', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationPhone,
                    controller: organizationPhoneController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationPAN);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('PAN', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationPAN,
                    controller: organizationPANController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationGST);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Gst', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationGST,
                    controller: organizationGSTController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationTDS);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('TDS Circle/AOD Code',
                      style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationTDS,
                    controller: organizationTDSController,
                    onEditingComplete: () {
                      FocusScope.of(context)
                          .requestFocus(organizationBuildingNo);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              //  color: Colors.red
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height:
                  MediaQuery.of(context).size.height / 1.6, //height of button
              width: MediaQuery.of(context).size.width / 4,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  const Text('Building No/Name',
                      style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationBuildingNo,
                    controller: organizationBuildingNoController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationLandMark);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('LandMark', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationLandMark,
                    controller: organizationLandMarkController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationCountry);
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Country', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                    child: TextField(

                      readOnly: true,
                      onTap: () async {

                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SelectCountry()),
                        );

                        if (result != null) {
                          setState(() {
                            organizationCountryController.text = result;
                          });
                        } else {}

                      },
                      focusNode: organizationCountry,
                      controller: organizationCountryController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationCity);
                      },
                      decoration:  InputDecoration(

                        suffixIcon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                        hintText: selectedCountry,
                        hintStyle: const TextStyle(color: Colors.black),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                       border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),

                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('City', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                    child: TextField(
                      focusNode: organizationCity,
                      controller: organizationCityController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationState);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Province/State', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,

                    child: TextField(

                        onTap: () async {

                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SelectState()),
                          );

                          if (result != null) {
                            setState(() {
                              organizationStateController.text = result;
                            });
                          } else {}


                      },
                      readOnly: true,
                      focusNode: organizationState,
                      controller: organizationStateController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationPIN);
                      },
                       decoration: const InputDecoration(
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                             borderSide: BorderSide(color: Colors.grey)),
                         hintText: "Kerala",
                         hintStyle: TextStyle(color: Colors.black),

                         suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black,),

                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Pin', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationPIN,
                    controller: organizationPINController,
                    // onEditingComplete: (){
                    //   FocusScope.of(context).requestFocus(organizationPhone);
                    // },
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              //  color: Colors.red
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height:
                  MediaQuery.of(context).size.height / 1.6, //height of button
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
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
              //color: Colors.pink
            ),
          ])),
      //color: Colors.blueGrey),
    ]);
  }

  Widget usersSettingScreen() {
    return Container(
      child: selectUsersScreen(user),
    );
  }

  selectUsersScreen(int user) {
    if (user == 1) {
      return usersListScreen();
    } else if (user == 2) {
      return createUserScreen();
    }
  }

  Widget createUserScreen() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,

          child: const Text('Users',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height / 1.3, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 3,
              ),
              TextFormField(
                focusNode: usersName,
                controller: userNameController,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    //allow upper and lower case alphabets and space
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'PIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height / 12, //height of button
                width: MediaQuery.of(context).size.width / 3,
                // color:Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      child: const TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 9,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          backgroundColor: Colors.orange,
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                        child: const Text('Generate'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height / 1.9, //height of button
                width: MediaQuery.of(context).size.width / 3,
                // color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color:Colors.red,
                      height: MediaQuery.of(context).size.height /
                          12, //height of button
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Admin Access',
                              style: TextStyle(fontWeight: FontWeight.w300)),
                          SizedBox(
                              //width: 100,
                              child: FlutterSwitch(
                            width: 40.0,
                            height: 20.0,
                            valueFontSize: 30.0,
                            toggleSize: 15.0,
                            value: switch1,
                            borderRadius: 20.0,
                            padding: 1.0,
                            activeColor: Colors.green,
                            activeTextColor: Colors.green,
                            inactiveTextColor: Colors.white,
                            inactiveColor: Colors.grey,
                            onToggle: (val) {
                              setState(() {
                                switch1 = val;
                                // printKitchen == true;
                              });
                            },
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color:Colors.green,
                      height: MediaQuery.of(context).size.height /
                          17, //height of button
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: const Text(
                        'Role',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(7),
                        // color:Colors.yellow,
                        height: MediaQuery.of(context).size.height /
                            15, //height of button
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dining',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                                //width: 100,
                                child: FlutterSwitch(
                              width: 40.0,
                              height: 20.0,
                              valueFontSize: 30.0,
                              toggleSize: 15.0,
                              value: diningSwitch,
                              borderRadius: 20.0,
                              padding: 1.0,
                              activeColor: Colors.green,
                              activeTextColor: Colors.green,
                              inactiveTextColor: Colors.white,
                              inactiveColor: Colors.grey,
                              onToggle: (val) {
                                setState(() {
                                  diningSwitch = val;
                                  // printKitchen == true;
                                });
                              },
                            ))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height /
                            15, //height of button
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Take Away',
                                style: TextStyle(fontWeight: FontWeight.w300)),
                            SizedBox(
                                //width: 100,
                                child: FlutterSwitch(
                              width: 40.0,
                              height: 20.0,
                              valueFontSize: 30.0,
                              toggleSize: 15.0,
                              value: takeSwitch,
                              borderRadius: 20.0,
                              padding: 1.0,
                              activeColor: Colors.green,
                              activeTextColor: Colors.green,
                              inactiveTextColor: Colors.white,
                              inactiveColor: Colors.grey,
                              onToggle: (val) {
                                setState(() {
                                  takeSwitch = val;
                                  // printKitchen == true;
                                });
                              },
                            ))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height /
                            15, //height of button
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Online',
                                style: TextStyle(fontWeight: FontWeight.w300)),
                            SizedBox(
                                //width: 100,
                                child: FlutterSwitch(
                              width: 40.0,
                              height: 20.0,
                              valueFontSize: 30.0,
                              toggleSize: 15.0,
                              value: onlineSwitch,
                              borderRadius: 20.0,
                              padding: 1.0,
                              activeColor: Colors.green,
                              activeTextColor: Colors.green,
                              inactiveTextColor: Colors.white,
                              inactiveColor: Colors.grey,
                              onToggle: (val) {
                                setState(() {
                                  onlineSwitch = val;
                                  // printKitchen == true;
                                });
                              },
                            ))
                          ],
                        )

                        //color: Colors.yellow
                        ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height /
                            15, //height of button
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Car',
                                style: TextStyle(fontWeight: FontWeight.w300)),
                            SizedBox(
                                //width: 100,
                                child: FlutterSwitch(
                              width: 40.0,
                              height: 20.0,
                              valueFontSize: 30.0,
                              toggleSize: 15.0,
                              value: carSwitch,
                              borderRadius: 20.0,
                              padding: 1.0,
                              activeColor: Colors.green,
                              activeTextColor: Colors.green,
                              inactiveTextColor: Colors.white,
                              inactiveColor: Colors.grey,
                              onToggle: (val) {
                                setState(() {
                                  carSwitch = val;
                                  // printKitchen == true;
                                });
                              },
                            ))
                          ],
                        )

                        //color: Colors.yellow
                        )
                  ],
                ),
              ),
            ],
          ),
          //  color: Colors.red[100],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          // color: Colors.red
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/add.svg',
                    ),
                    iconSize: 40),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/delete.svg'),
                  iconSize: 40,
                )
              ]),
        )
      ],
    );
  }

  Widget usersListScreen() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 16, //height of button
            width: MediaQuery.of(context).size.width / 1,

            child: const Text('Users',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20,
                )),
          ),
          SizedBox(
            height:
                MediaQuery.of(context).size.height / 1.40, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            //  color: Colors.red[100],
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/user.svg'),
                        ),
                        title: const Text("<User Name> "),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/arrow.svg'),
                        ),
                      ));
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16, //height of button
            width: MediaQuery.of(context).size.width / 1,
            // color: Colors.red
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      user = 2;
                    });
                  },
                  icon: SvgPicture.asset('assets/svg/addmore.svg'),
                  iconSize: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contactUSScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,

          child: const Text('Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
            height:
                MediaQuery.of(context).size.height / 1.40, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            child: const Text('Contact Details '))
      ],
    );
  }

  Widget privacyPoliciesScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('Privacy Policies',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
            height:
                MediaQuery.of(context).size.height / 1.40, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            child: const Text('Policies '))
      ],
    );
  }

  Widget termsAndConditionScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('Terms And Conditions',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          child: SfPdfViewer.asset('assets/pdf/Termsandconditions.pdf'),
        )
      ],
    );
  }

  Widget versionDetailScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('Version Details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
            height:
                MediaQuery.of(context).size.height / 1.40, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/Logo.svg'),
                const SizedBox(
                  height: 8,
                ),
                const Text('Current App Version is: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ))
              ],

              //
            ))
      ],
    );
  }

  Widget languagesScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //  color: Colors.red[100],
          child: const Text('Language',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          // color: Colors.red[100],
          child: ListView(children: <Widget>[
            Card(
              color: Colors.grey[100],
              child: ListTile(
                title: const Text('English'),
                trailing: GestureDetector(
                  child: Container(
                    width: 20,
                    height: 20,
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c1,
                        border: Border.all(color: Colors.grey)),
                  ),
                  onTap: () {
                    setState(() {
                      c1 = Colors.green;
                      c2 = Colors.white;
                      c3 = Colors.white;
                    });
                  },
                ),
              ),
            ),
            Card(
              color: Colors.grey[100],
              child: ListTile(
                  title: const Text('Arabic'),
                  trailing: GestureDetector(
                    child: Container(
                      width: 20,
                      height: 20,
                      child: const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: c2,
                          border: Border.all(color: Colors.grey)),
                    ),
                    onTap: () {
                      setState(() {
                        c1 = Colors.white;
                        c2 = Colors.green;
                        c3 = Colors.white;
                      });
                    },
                  )),
            ),
          ]),
        )
      ],
    );
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()));
  }

  Future<Null> getKitchenListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? "0";
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/list/pos-kitchen/';

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
        var responseJson = n["data"].reversed.toList();

        if (status == 6000) {
          setState(() {
            kitchenList.clear();
            stop();
            for (Map user in responseJson) {
              kitchenList.add(KitchenListModel.fromJson(user));
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

  Future<Null> createKitchenApi() async {
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
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var categoryID = 1;
        var accessToken = prefs.getString('access') ?? '';

        final String url = "$baseUrl/posholds/pos-kitchen/";
        print(url);

        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "CategoryID": categoryID,
          "IsActive": true,
          "KitchenName": kitchenNameController.text,
          "IPAddress": "",
          "Notes": descriptionController.text,
          "Type": "create",
          "unqid": "",
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
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        if (status == 6000) {
          setState(() {
            kitchen = 1;
            stop();
            getKitchenListApi();
          });
        }
        else if (status == 6001) {
          stop();
        } else {}
      } catch (e) {
        setState(() {
          snackBarMessage(context, "Some thing went wrong");
          stop();
        });
      }
    }
  }
}

enum ConfirmAction { cancel, accept }

Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are You Sure to Exit.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.cancel);
            },
          ),
          TextButton(
            child: const Text('Log out'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.accept);
            },
          )
        ],
      );
    },
  );
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

List<KitchenListModel> kitchenList = [];

class KitchenListModel {
  String id, kitchenName, ip, companyID, notes;
  int kitchenID, branchID;

  KitchenListModel(
      {required this.id,
      required this.kitchenID,
      required this.branchID,
      required this.kitchenName,
      required this.ip,
      required this.companyID,
      required this.notes});

  factory KitchenListModel.fromJson(Map<dynamic, dynamic> json) {
    return KitchenListModel(
        id: json['id'],
        kitchenID: json['KitchenID'],
        branchID: json['BranchID'],
        kitchenName: json['KitchenName'],
        ip: json['IPAddress'],
        companyID: json['CompanyID'],
        notes: json['Notes']);
  }
}
class OrganisationCountry{
  static String country_id ="";
  static String state_id ="";
}

// class CreateOrganizationModel{
//   String updatedUserId,,owner,createdUserId,companyName,state,country,buisnessType,edition,email,phone,address1,address2,city,postalCode;
//   int gstNo,VatNo;
//   bool isRegistered,isVat,isGst,isRegisteredGst;
//
//   CreateOrganizationModel({
//     required this.updatedUserId,
//     required this.country,required this.edition,required this.phone,required this.email,required this.postalCode,required this.state,required this.city,
//     required this.address1,required this.address2,required this.buisnessType,required this.companyName,required this.createdUserId,required this.gstNo,required this.isGst,
//     required this.isRegistered,required this.isRegisteredGst,required this.isVat,required this.owner,required this.VatNo
//
// });
//   factory CreateOrganizationModel.fromJson(Map<dynamic, dynamic> json) {
//     return CreateOrganizationModel(
//         country: json['Country'],
//       owner: json['owner'],
//       edition: json['Edition'],
//       isVat: json['is_vat'],
//       companyName: json['CompanyName'], address2: '',
//
//
//
//
//
//     );
//   // "UpdatedUserID": 371,
//   // "owner": 371,
//   // "CreatedUserID": 371,
//   // "": "D Company ",
//   // "State": "19b4fb50-6882-4d29-81cc-0591191f25e6",
//   // "Country": "30f8c506-e27a-476c-8950-b40a6461bf61",
//   // "GSTNumber": 1,
//   // "VATNumber": 1,
//   // "FromDate": 1,
//   // "ToDate": 1,
//   // "business_type": "",
//   // "is_registeredVat":false,
//   // "":false,
//   // "is_gst":true,
//   // "is_registeredGst":true,
//   // "":"Standard",
//   // "Email":"rabeeh@gamil.com",
//   // "Phone":8714152075,
//   // "Address1":"",
//   // "Address2":"",
//   // "City":"calicut",
//   // "PostalCode":"678900"
// }
