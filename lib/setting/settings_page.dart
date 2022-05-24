import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rassasy_tab/global/global.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'org_detail/select_country.dart';
import 'org_detail/select_state.dart';
import 'user_detail/roles_list.dart';
import 'user_detail/select_user.dart';

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

  bool edit = false;
  bool switchControl = false;
  bool switchControl1 = false;
  bool status = false;
  bool quantityIncrement = false;
  bool diningSwitch = false;
  bool kitchenSwitch = false;
  bool takeSwitch = false;
  bool carSwitch = false;
  bool onlineSwitch = false;
  bool showInvoice = false;
  bool clearTable = false;
  bool printAfterPayment = false;
  bool payAfterSave = false;
  bool printPreview = false;
  var printer = 1;
  var kitchen = 1;
  var index = 0;
  var user = 1;
  var organization = 1;
  bool paymentMethod = false;
  bool addPrinter = false;
  bool printKitchen = true;

  bool roleList = false;
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
  late FocusNode saveData = FocusNode();

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
  TextEditingController organizationAddress1Controller =
      TextEditingController();
  TextEditingController organizationAddress2Controller =
      TextEditingController();
  TextEditingController organizationCityController = TextEditingController();
  TextEditingController organizationStateController = TextEditingController();
  TextEditingController organizationPINController = TextEditingController();
  TextEditingController kitchenNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController userPinController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController pinGenerateController = TextEditingController();
  TextEditingController roleNameController = TextEditingController();
  ScrollController companyListController = ScrollController();
  ScrollController kitchenListController = ScrollController();

  var selectedCountry = "India";
  var taxType = "GST";
  String orgCountryId = "";
  String _date = "2033/01/01";
  String dates = "2022/01/01";
  String fromDate = "2022/01/01";
  String toDate = "2022/01/01";
  String pinNo = "235534";
  String userId = "235534";
  String roleId = "235534";

  @override
  void initState() {
    super.initState();

    setState(() {
      super.initState();
      OrganisationCountry.country_id = "30f8c506-e27a-476c-8950-b40a6461bf61";
      OrganisationCountry.state_id = "19b4fb50-6882-4d29-81cc-0591191f25e6";
    });
    Future.delayed(Duration.zero, () {
      getCompanyListDetails();
      getAllUsersList();
    });
    getKitchenListApi();
    DateTime dt = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dt);
    _date = '$formatted';

    DateTime dat = DateTime.now();
    final DateFormat formatterr = DateFormat('dd-MM-yyyy');
    final String formatteds = formatterr.format(dat);
    dates = '$formatteds';

    loadData();
  }

  void switchStatus(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    quantityIncrement = prefs.getBool("qty_increment") ?? false;
    showInvoice = prefs.getBool("Show Invoice") ?? false;
    clearTable = prefs.getBool("Clear Table After Payment") ?? false;
    printAfterPayment = prefs.getBool("Print After Payment") ?? false;
    payAfterSave = prefs.getBool("Pay After Save") ?? false;
    printPreview = prefs.getBool('Print Preview') ?? false;
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
                      value: quantityIncrement,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,
                      onToggle: (val) {
                        setState(() {
                          quantityIncrement = val;
                          switchStatus("qty_increment", quantityIncrement);
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
                        value: showInvoice,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        inactiveTextColor: Colors.white,
                        inactiveColor: Colors.grey,

                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            showInvoice = val;
                            switchStatus("Show Invoice", showInvoice);
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
                        value: clearTable,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        inactiveTextColor: Colors.white,
                        inactiveColor: Colors.grey,

                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            clearTable = val;
                            switchStatus(
                                "Clear Table After Payment", clearTable);
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

            ///default payment method
            // Card(
            //   shape: RoundedRectangleBorder(
            //     side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
            //     borderRadius: BorderRadius.circular(2),
            //   ),
            //   color: Colors.grey[100],
            //   child: ListTile(
            //     title: const Text('Default Payment Method'),
            //     trailing: IconButton(
            //       onPressed: () {},
            //       icon: SvgPicture.asset('assets/svg/arrow.svg'),
            //     ),
            //     onTap: () {
            //       setState(() {
            //         paymentMethod = true;
            //       });
            //     },
            //   ),
            // ),
            // paymentMethod == true
            //     ? Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           SizedBox(
            //             height: MediaQuery.of(context).size.height /
            //                 16, //height of button
            //             width: MediaQuery.of(context).size.width / 1,
            //             // color: Colors.green[100],
            //             child: const Text('Payment Method',
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.w600,
            //                   color: Colors.black,
            //                   fontSize: 20,
            //                 )),
            //           ),
            //           SizedBox(
            //             //height of button
            //             width: MediaQuery.of(context).size.width / 1.1,
            //             height: MediaQuery.of(context).size.height / 6,
            //
            //             child: ListView(children: <Widget>[
            //               Card(
            //                 shape: RoundedRectangleBorder(
            //                   side: const BorderSide(
            //                       color: Color(0xffDFDFDF), width: 1),
            //                   borderRadius: BorderRadius.circular(2),
            //                 ),
            //                 color: Colors.grey[100],
            //                 child: ListTile(
            //                   title: const Text('Cash'),
            //                   trailing: GestureDetector(
            //                     child: Container(
            //                       width: 20,
            //                       height: 20,
            //                       child: const Icon(
            //                         Icons.check,
            //                         size: 16,
            //                         color: Colors.white,
            //                       ),
            //                       decoration: BoxDecoration(
            //                           shape: BoxShape.circle,
            //                           color: colors1,
            //                           border: Border.all(color: Colors.grey)),
            //                     ),
            //                     onTap: () {
            //                       setState(() {
            //                         colors1 = Colors.green;
            //                         colors2 = Colors.white;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ),
            //               Card(
            //                 shape: RoundedRectangleBorder(
            //                   side: const BorderSide(
            //                       color: Color(0xffDFDFDF), width: 1),
            //                   borderRadius: BorderRadius.circular(2),
            //                 ),
            //                 color: Colors.grey[100],
            //                 child: ListTile(
            //                   title: const Text('Bank'),
            //                   trailing: GestureDetector(
            //                     child: Container(
            //                       width: 20,
            //                       height: 20,
            //                       child: const Icon(
            //                         Icons.check,
            //                         size: 16,
            //                         color: Colors.white,
            //                       ),
            //                       decoration: BoxDecoration(
            //                           shape: BoxShape.circle,
            //                           color: colors2,
            //                           border: Border.all(color: Colors.grey)),
            //                     ),
            //                     onTap: () {
            //                       setState(() {
            //                         colors2 = Colors.green;
            //                         colors1 = Colors.white;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               )
            //             ]),
            //           )
            //         ],
            //       )
            //     : Container(),
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
                      value: printAfterPayment,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,

                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          printAfterPayment = val;
                          switchStatus(
                              "Print After Payment", printAfterPayment);
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
                      value: payAfterSave,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,

                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          payAfterSave = val;
                          switchStatus("Pay After Save", payAfterSave);
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
                      value: printPreview,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,
                      inactiveTextColor: Colors.white,
                      inactiveColor: Colors.grey,
                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          printPreview = val;
                          switchStatus("Print Preview", printPreview);
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
    return ListView(shrinkWrap: true, children: [
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
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Printer Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                child: TextFormField(
                  focusNode: printerName,
                  controller: printerNameController,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(ipAddress1);
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
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
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Ip Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                    child: TextFormField(
                      focusNode: ipAddress1,
                      controller: ipAddressController1,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(ipAddress2);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          return "Enter Correct Number";
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
                    child: TextFormField(
                      focusNode: ipAddress2,
                      controller: ipAddressController2,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(ipAddress3);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          return "Enter Correct Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
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
                    child: TextFormField(
                      focusNode: ipAddress3,
                      controller: ipAddressController3,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(ipAddress4);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
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
                  Container(
                    alignment: Alignment.center,
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
                    child: TextFormField(
                      focusNode: ipAddress4,
                      controller: ipAddressController4,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(saveIcon);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        isDense: true,
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
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              ///
              createPrinterApi();
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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 16, //height of button
          width: MediaQuery.of(context).size.width / 1,
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
                controller: kitchenListController,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      controller: descriptionController,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.multiline,
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
                          value: quantityIncrement,
                          borderRadius: 20.0,
                          padding: 1.0,
                          activeColor: Colors.green,
                          activeTextColor: Colors.green,
                          inactiveTextColor: Colors.white,
                          inactiveColor: Colors.grey,
                          onToggle: (val) {
                            setState(() {
                              quantityIncrement = val;
                              // printKitchen == true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  quantityIncrement == true
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
              child: ListView.builder(
                  controller: companyListController,
                  shrinkWrap: true,
                  itemCount: companyList.length,
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
                          title: Text(companyList[index].companyName),
                          // const Text("Company Name "),
                          subtitle: Text(companyList[index].companyType),
                          //  const Text('Place'),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      focusNode: organizationName,
                      controller: organizationNameController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationRegNo);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      focusNode: organizationRegNo,
                      controller: organizationRegNoController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(financialYear1);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
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
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 9,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 1);
                            },
                            focusNode: financialYear1,
                            controller: financialYear1Controller,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(financialYear2);
                            },
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: _date,
                              isDense: true,
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 9,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, 2);
                            },
                            focusNode: financialYear2,
                            controller: financialYear2Controller,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(organizationEmail);
                            },
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: dates,
                              isDense: true,
                              contentPadding: EdgeInsets.all(12),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: organizationEmail,
                      controller: organizationEmailController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationPhone);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Phone', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      focusNode: organizationPhone,
                      controller: organizationPhoneController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationPAN);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('PAN', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      focusNode: organizationPAN,
                      controller: organizationPANController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationGST);
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Gst', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      focusNode: organizationGST,
                      controller: organizationGSTController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationTDS);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      focusNode: organizationTDS,
                      controller: organizationTDSController,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(organizationBuildingNo);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      focusNode: organizationBuildingNo,
                      controller: organizationBuildingNoController,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(organizationLandMark);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('LandMark', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      focusNode: organizationLandMark,
                      controller: organizationLandMarkController,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(organizationCountry);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
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
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectCountry()),
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
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        hintText: selectedCountry,
                        hintStyle: const TextStyle(color: Colors.black),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
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
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      focusNode: organizationCity,
                      controller: organizationCityController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(organizationState);
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
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
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectState()),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: "Kerala",
                        hintStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      focusNode: organizationPIN,
                      controller: organizationPINController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(saveData);
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(),
                      ),
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
                      onPressed: () async {
                        if (organizationNameController.text == '' &&
                            organizationEmailController.text == '' &&
                            organizationStateController.text == '' &&
                            organizationCountryController.text == '' &&
                            organizationPhoneController.text == '') {
                          // print("please enter all field");
                          snackBarMessage(
                              context, "Please Enter Mandatory Fields");
                        } else {
                          start(context);

                          createOrganizationApi();
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
                itemCount: usersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey, width: .5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        onLongPress: () {
                          _showAlertDialog(usersList[index].uuid, "");
                        },
                        onTap: () {
                          setState(() {
                            edit = true;
                            getUserSingleView(usersList[index].uuid);
                            user = 2;
                          });

                          //  UserDetails.user_id=usersList[index].id;
                        },
                        leading: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/user.svg'),
                        ),
                        title: Text(usersList[index].userName),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                child: TextFormField(
                  readOnly: true,
                  onTap: () async {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectUser()),
                    );

                    print(result);

                    if (result != null) {
                      setState(() {
                        userNameController.text = result;
                      });
                    } else {}
                  },
                  focusNode: usersName,
                  controller: userNameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
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
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: const Text(
                        'PIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: const Text(
                        'Role',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        12, //height of button
                    width: MediaQuery.of(context).size.width / 3.6,
                    // color:Colors.red,
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 7,
                          child: TextField(
                            readOnly: true,
                            controller: pinGenerateController,
                            decoration: const InputDecoration(
                              //   hintText: pinNo,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(17.0),
                              primary: Colors.white,
                              backgroundColor: Colors.orange,
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              generatePinNumber();
                            },
                            child: const Text('Generate'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        12, //height of button
                    width: MediaQuery.of(context).size.width / 3.6,
                    // color:Colors.red,
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 7,
                          child: TextField(
                            onTap: () async {
                              var result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectRole()),
                              );

                              print(result);

                              if (result != null) {
                                setState(() {
                                  userRoleController.text = result;
                                });
                              } else {}
                            },
                            readOnly: true,
                            controller: userRoleController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              isDense: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(17.0),
                              primary: Colors.white,
                              backgroundColor: Colors.orange,
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              setState(() {
                                roleList = true;
                              });
                            },
                            child: const Text('New'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ///admin access
              // SizedBox(
              //   height:
              //       MediaQuery.of(context).size.height / 1.9, //height of button
              //   width: MediaQuery.of(context).size.width / 3,
              //   // color: Colors.red,
              //   child: Column(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(8),
              //         // color:Colors.red,
              //         height: MediaQuery.of(context).size.height /
              //             12, //height of button
              //         width: MediaQuery.of(context).size.width / 3,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             const Text('Admin Access',
              //                 style: TextStyle(fontWeight: FontWeight.w300)),
              //             SizedBox(
              //               //width: 100,
              //                 child: FlutterSwitch(
              //                   width: 40.0,
              //                   height: 20.0,
              //                   valueFontSize: 30.0,
              //                   toggleSize: 15.0,
              //                   value: quantityIncrement,
              //                   borderRadius: 20.0,
              //                   padding: 1.0,
              //                   activeColor: Colors.green,
              //                   activeTextColor: Colors.green,
              //                   inactiveTextColor: Colors.white,
              //                   inactiveColor: Colors.grey,
              //                   onToggle: (val) {
              //                     setState(() {
              //                       quantityIncrement = val;
              //                       // printKitchen == true;
              //                     });
              //                   },
              //                 ))
              //           ],
              //         ),
              //       ),
              //
              //
              //
              //     ],
              //   ),
              // ),

              roleList == true
                  ? Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Role',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextField(
                              controller: roleNameController,
                              decoration: const InputDecoration(
                                hintText: "Role Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height /
                                  15, //height of button
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Dining',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Take Away',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Online',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
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
                              )),
                          Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height /
                                  15, //height of button
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Car',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
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
                              )),
                          Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height /
                                  15, //height of button
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Kitchen',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(
                                      child: FlutterSwitch(
                                    width: 40.0,
                                    height: 20.0,
                                    valueFontSize: 30.0,
                                    toggleSize: 15.0,
                                    value: kitchenSwitch,
                                    borderRadius: 20.0,
                                    padding: 1.0,
                                    activeColor: Colors.green,
                                    activeTextColor: Colors.green,
                                    inactiveTextColor: Colors.white,
                                    inactiveColor: Colors.grey,
                                    onToggle: (val) {
                                      setState(() {
                                        kitchenSwitch = val;
                                        // printKitchen == true;
                                      });
                                    },
                                  ))
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height /
                                13, //height of button
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(10.0),
                                    primary: Colors.white,
                                    backgroundColor: Colors.green,
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      createNewRoleApi();
                                      roleList = false;
                                    });
                                  },
                                  child: const Text('Add'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Container()
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
                    onPressed: () {
                      setState(() {
                        //  createNewUser();
                        if (userNameController.text == '' ||
                            pinGenerateController.text == '' ||
                            userRoleController.text == '') {
                          //
                        } else {
                          edit == true
                              ? editUserDetail(posUserId)
                              : createNewUser();
                        }
                      });
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/add.svg',
                    ),
                    iconSize: 40),
                IconButton(
                  onPressed: () {
                    setState(() {
                      userNameController.clear();
                      userRoleController.clear();
                      pinGenerateController.clear();
                      user = 1;
                    });
                  },
                  icon: SvgPicture.asset('assets/svg/delete.svg'),
                  iconSize: 40,
                )
              ]),
        )
      ],
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
        var responseJson = n["data"];

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
        } else if (status == 6001) {
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
        print(url);

        Map data = {"userId": userID};
        print('data');
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
        var responseJson = n["data"];
        if (status == 6000) {
          setState(() {
            stop();
            companyList.clear();
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

  Future<Null> createOrganizationApi() async {
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
        var accessToken = prefs.getString('access') ?? '';
        var countryId = OrganisationCountry.country_id;
        var stateId = OrganisationCountry.state_id;

        final String url =
            "$baseUrl/companySettings/create/companySettingsCreate/";
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "CompanyLogo": "",
          "UpdatedUserID": userID,
          "owner": userID,
          "CreatedUserID": userID,
          "CompanyName": organizationNameController.text,
          "State": stateId,
          "Country": countryId,
          "GSTNumber": "12345676",
          "VATNumber": "",
          "FromDate": fromDate,
          "ToDate": toDate,
          "business_type": "c067b77d-1056-4eb8-9769-0733a29a0e9f",
          "is_registeredVat": false,
          "is_vat": false,
          "is_gst": true,
          "is_registeredGst": true,
          "Edition": "Standard",
          "Email": organizationEmailController.text,
          "Phone": organizationPhoneController.text,
          "Address1": organizationAddress1Controller.text,
          "Address2": organizationAddress2Controller.text,
          "City": organizationCityController.text,
          "PostalCode": organizationPINController.text
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
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        if (status == 6000) {
          setState(() {
            organization = 1;
            stop();
            getCompanyListDetails();
          });
        } else if (status == 6001) {
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

  Future<Null> _selectDate(BuildContext context, type) async {
    DatePicker.showDatePicker(context,
        theme: const DatePickerTheme(
          containerHeight: 200.0,
        ),
        showTitleActions: true,
        minTime: DateTime(2000, 01, 01),
        maxTime: DateTime(2030, 12, 31), onConfirm: (date) {
      print('confirm $date');
      _date = '${date.year} - ${date.month} - ${date.day}';

      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(date);
        print(formatted);
        _date = '$formatted';

        if (type == 1) {
          fromDate = formatter1.format(date);
          financialYear1Controller.text = _date;
        } else if (type == 2) {
          toDate = formatter1.format(date);
          financialYear2Controller.text = _date;
        }
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  Future<Null> createPrinterApi() async {
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
        var ipAddress = ipAddressController1.text +
            '.' +
            ipAddressController2.text +
            '.' +
            ipAddressController3.text +
            '.' +
            ipAddressController4.text;

        var accessToken = prefs.getString('access') ?? '';

        String baseUrl = BaseUrl.bUrl;
        final String url = '$baseUrl/posholds/printer-create/';

        //   const String url =   "http://103.177.224.30:8080/api/v9/posholds/printer-create/";
        print(url);

        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "IPAddress": ipAddress,
          "PrinterName": printerNameController.text
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
        print(status);
        if (status == 6000) {
          setState(() {
            var msg = n["message"];
            snackBarMessage(context, msg);
            stop();
          });
        } else if (status == 6001) {
          var msg = n["message"];
          snackBarMessage(context, msg);

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

  Future<Null> createNewRoleApi() async {
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
        //   const String url = "https://api.viknbooks.com/api/v9/posholds/create-pos-role/";
        String baseUrl = BaseUrl.bUrl;
        final String url = '$baseUrl/posholds/create-pos-role/';
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "CreatedUserID": userID,
          "PriceRounding": 2,
          "RoleName": roleNameController.text,
          "show_car": carSwitch,
          "show_dining": diningSwitch,
          "show_kitchen": kitchenSwitch,
          "show_online": onlineSwitch,
          "show_take_away": takeSwitch
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
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        if (status == 6000) {
          setState(() {
            stop();
          });
        } else if (status == 6001) {
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

  Future<Null> generatePinNumber() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String baseUrl = BaseUrl.bUrl;

        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/generate-pos-pin/';

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
        print(response.body);

        Map n = json.decode(utf8.decode(response.bodyBytes));
        var statusCode = n["StatusCode"];

        if (statusCode == 6000) {
          setState(() {
            pinGenerateController.text = n["PinNo"].toString();
            stop();
          });
        } else if (statusCode == 6001) {
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

  Future<Null> createNewUser() async {
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
        var user_id = UserDetails.employeeID;
        var roleId = UserDetails.role_id;
        var pinNum = pinGenerateController.text;

        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final String url = '$baseUrl/posholds/create-pos-user/';

        // String url="http://103.177.224.30:8080/api/v9/posholds/create-pos-user/";
        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "CreatedUserID": userID,
          "PriceRounding": 2,
          "PinNo": pinNum,
          "Role": roleId,
          "User": user_id
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
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        if (status == 6000) {
          setState(() {
            user = 1;
            stop();
          });
        } else if (status == 6001) {
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

  Future<Null> getAllUsersList() async {
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
        String baseUrl = BaseUrl.bUrl;
        final String url = '$baseUrl/posholds/list/pos-users/';

        var accessToken = prefs.getString('access') ?? '';
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
        print(response.body);
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(responseJson);
        print(status);
        if (status == 6000) {
          setState(() {
            usersList.clear();
            stop();
            for (Map user in responseJson) {
              usersList.add(UserListModel.fromJson(user));
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
                    onPressed: () => {
                          Navigator.of(context).pop(),
                          deleteUser(id, context),
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
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          );
        });
  }

  deleteUser(id, BuildContext context) async {
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
        var userID = prefs.getInt("user_id");
        var custID = id;
        String baseUrl = BaseUrl.bUrl;
        final String url = '$baseUrl/posholds/delete/pos-user/$custID/';
        // String url="http://103.177.224.30:8080/api/v9/posholds/delete/pos-user/$custID/";
        print(url);

        /// data
        Map data = {
          "CreatedUserID": userID,
          "CompanyID": companyID,
        };
        print(data);

        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"]; //6000 status or messege is here
        print(response.body);
        print(status);
        if (status == 6000) {
          setState(() {
            usersList.clear();
            stop();
            getAllUsersList();
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

  Future<Null> editUserDetail(posUserId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        HttpOverrides.global = MyHttpOverrides();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var branchID = BaseUrl.branchID;
        var accessToken = prefs.getString('access') ?? '';
        var userUId = UserDetails.employeeID;
        var roleId = UserDetails.role_id;
        var pinNo = pinGenerateController.text;
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/edit/pos-user/$posUserId/';

        print(url);

        Map data = {
          "CompanyID": companyID,
          "User": userUId,
          "Role": roleId,
          "PinNo": pinNo,
          "BranchID": branchID
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

        print(status);
        if (status == 6000) {
          setState(() {
            var msg = n["message"];
            snackBarMessage(context, msg);
            stop();
            user = 1;
          });
        } else if (status == 6001) {
          var msg = n["message"];
          snackBarMessage(context, msg);

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

  var posUserId;

  Future<Null> getUserSingleView(id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        HttpOverrides.global = MyHttpOverrides();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';

        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/single/pos-user/$id/';
        print(url);
        Map data = {
          "CompanyID": companyID,
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
        if (status == 6000) {
          setState(() {
            stop();
            posUserId = id;
            userNameController.text = responseJson['UserName'];
            userRoleController.text = responseJson['RoleName'];
            pinGenerateController.text = responseJson['PinNo'];
            UserDetails.employeeID = responseJson['User'];
            UserDetails.role_id = responseJson['Role'];
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

class OrganisationCountry {
  static String country_id = "";
  static String state_id = "";
}

List<CompanyListDataModel> companyList = [];

class CompanyListDataModel {
  final bool isPosUser;
  final String id, companyName, companyType, expiryDate, permission, edition;

  CompanyListDataModel(
      {required this.id,
      required this.companyType,
      required this.companyName,
      required this.isPosUser,
      required this.edition,
      required this.expiryDate,
      required this.permission});

  factory CompanyListDataModel.fromJson(Map<dynamic, dynamic> json) {
    return CompanyListDataModel(
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

List<UserListModel> usersList = [];

class UserListModel {
  String uuid, userName, role, roleName, pinNo, user;

  UserListModel(
      {required this.uuid,
      required this.roleName,
      required this.pinNo,
      required this.user,
      required this.role,
      required this.userName});

  factory UserListModel.fromJson(Map<dynamic, dynamic> json) {
    return UserListModel(
      uuid: json['id'],
      user: json['User'],
      pinNo: json['PinNo'],
      roleName: json['RoleName'],
      role: json['Role'],
      userName: json['UserName'],
    );
  }
}

class UserDetails {
  static String role_id = "";
  static String employeeID = "";
  static String userUid = "";
  static String pinNo = " ";
}
