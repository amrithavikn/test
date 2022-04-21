import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/login.dart';
import 'package:rassasy_tab/screen/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_switch/flutter_switch.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  bool switchControl = false;
  bool switchControl1 = false;
  bool status = false;
  bool switch1 = false;
  bool diningswitch = false;
  bool takeSwitch = false;
  bool carSwitch = false;
  bool onlineSwitch = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;
  var printSettings = 1;
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
  Color setting2 = Color(0xffF3F3F3);
  Color setting3 = Color(0xffF3F3F3);
  Color setting4 = Color(0xffF3F3F3);
  Color setting5 = Color(0xffF3F3F3);
  Color setting6 = Color(0xffF3F3F3);
  Color setting7 = Color(0xffF3F3F3);
  Color setting8 = Color(0xffF3F3F3);
  Color setting9 = Color(0xffF3F3F3);
  Color setting10 = Color(0xffF3F3F3);
  Color setting11 = Color(0xffF3F3F3);
  Color borderColor1 = Colors.transparent;
  Color borderColor2 = Colors.orange;

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  final _formKey = GlobalKey<FormState>();
  late FocusNode ipAddress1;
  late FocusNode ipAddress2;
  late FocusNode ipAddress3;
  late FocusNode ipAddress4;
  late FocusNode printerName;
  late FocusNode saveIcon;
  late FocusNode usersName;

  late FocusNode organizationName;
  late FocusNode organizationRegNo;
  late FocusNode financialYear1;
  late FocusNode financialYear2;
  late FocusNode organizationEmail;
  late FocusNode organizationPhone;
  late FocusNode organizationPAN;
  late FocusNode organizationGST;
  late FocusNode organizationTDS;
  late FocusNode organizationBuildingNo;
  late FocusNode organizationLandMark;
  late FocusNode organizationCountry;
  late FocusNode organizationCity;
  late FocusNode organizationState;
  late FocusNode organizationPIN;

  late TextEditingController printerNameController;
  late TextEditingController ipAddressController1;
  late TextEditingController ipAddressController2;
  late TextEditingController ipAddressController3;
  late TextEditingController ipAddressController4;
  late TextEditingController userNameController;
  late TextEditingController organizationNameController;
  late TextEditingController organizationRegNoController;
  late TextEditingController financialYear1Controller;
  late TextEditingController financialYear2Controller;
  late TextEditingController organizationEmailController;
  late TextEditingController organizationPhoneController;
  late TextEditingController organizationPANController;
  late TextEditingController organizationGSTController;
  late TextEditingController organizationTDSController;
  late TextEditingController organizationBuildingNoController;
  late TextEditingController organizationLandMarkController;
  late TextEditingController organizationCountryController;
  late TextEditingController organizationCityController;
  late TextEditingController organizationStateController;
  late TextEditingController organizationPINController;

  @override
  void initState() {
    super.initState();
    ipAddress1 = FocusNode();
    ipAddress2 = FocusNode();
    ipAddress3 = FocusNode();
    ipAddress4 = FocusNode();
    printerName = FocusNode();
    saveIcon = FocusNode();
    usersName = FocusNode();
    organizationName = FocusNode();
    organizationRegNo = FocusNode();
    financialYear1 = FocusNode();
    financialYear2 = FocusNode();
    organizationEmail = FocusNode();
    organizationPhone = FocusNode();
    organizationPAN = FocusNode();
    organizationGST = FocusNode();
    organizationTDS = FocusNode();
    organizationBuildingNo = FocusNode();
    organizationLandMark = FocusNode();
    organizationCountry = FocusNode();
    organizationCity = FocusNode();
    organizationState = FocusNode();
    organizationPIN = FocusNode();

    printerNameController = TextEditingController();
    ipAddressController1 = TextEditingController();
    ipAddressController2 = TextEditingController();
    ipAddressController3 = TextEditingController();
    ipAddressController4 = TextEditingController();
    userNameController = TextEditingController();
    organizationNameController = TextEditingController();
    organizationNameController = TextEditingController();
    organizationRegNoController = TextEditingController();
    financialYear1Controller = TextEditingController();
    financialYear2Controller = TextEditingController();
    organizationEmailController = TextEditingController();
    organizationPhoneController = TextEditingController();
    organizationPANController = TextEditingController();
    organizationGSTController = TextEditingController();
    organizationTDSController = TextEditingController();
    organizationBuildingNoController = TextEditingController();
    organizationLandMarkController = TextEditingController();
    organizationCountryController = TextEditingController();
    organizationCityController = TextEditingController();
    organizationStateController = TextEditingController();
    organizationPINController = TextEditingController();
  }

  @override
  void dispose() {
    ipAddress1.dispose();
    ipAddress2.dispose();
    ipAddress3.dispose();
    ipAddress4.dispose();
    printerName.dispose();
    saveIcon.dispose();
    usersName.dispose();
    organizationName.dispose();
    organizationRegNo.dispose();
    financialYear1.dispose();
    financialYear2.dispose();
    organizationEmail.dispose();
    organizationPhone.dispose();
    organizationPAN.dispose();
    organizationGST.dispose();
    organizationTDS.dispose();
    organizationBuildingNo.dispose();
    organizationLandMark.dispose();
    organizationCountry.dispose();
    organizationCity.dispose();
    organizationState.dispose();
    organizationPIN.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
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
                      children: <Widget>[
                        selectSettingList(index)
                      ],
                    )),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: settingsList()))
            ])));
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  Widget generalSettings() {
    return Container(
        // color: Colors.grey[100],
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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
        Container(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          // color: Colors.red[100],
          child: ListView(children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Quantity Increment'),
                trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                  title: Text('Show Invoice'),
                  trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                  title: Text('Clear Table After Payment'),
                  trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Default Payment Method'),
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
                      Container(
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
                      Container(
                        //height of button
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 6,

                        child: ListView(children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xffDFDFDF), width: 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            color: Colors.grey[100],
                            child: ListTile(
                              title: Text('Cash'),
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
                              side: BorderSide(
                                  color: Color(0xffDFDFDF), width: 1),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            color: Colors.grey[100],
                            child: ListTile(
                              title: Text('Bank'),
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Print After Payment'),
                trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Pay After Save'),
                trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Print Preview'),
                trailing: Container(
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                title: Text('Customize Print'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/arrow.svg'),
                ),
              ),
            ),
          ]),
        )
      ],
    ));
  }

  Widget printerSettings() {
    return Container(child: check(printSettings));
  }

  check(print) {
    if (print == 1) {
      return printerSetting();
    } else if (print == 2) {
      return addPrinters();
    }
  }

  Widget printerSetting() {
    //PRINTER SETTING PAGE
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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

        Container(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,

          child: ListView(children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/wifi.svg'),
                ),
                title: Text('<Wifi Printer>'),
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/usb.svg'),
                ),
                title: Text('<Usb Printer>'),
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
                side: BorderSide(color: Color(0xffDFDFDF), width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.grey[100],
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/bluetooth.svg'),
                ),
                title: Text('<Bluetooth Printer>'),
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
        Container(
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
                      printSettings = 2;
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

  Widget addPrinters() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Add Printer',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 1.40, //height of button
        width: MediaQuery.of(context).size.width / 1.1,

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
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
              Container(
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
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 10,
                      //  color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // validationn
                          Container(
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
                          Container(
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
                          Container(
                            width: MediaQuery.of(context).size.width / 28,
                            height: MediaQuery.of(context).size.height / 16,
                            child: const Text(
                              '.',
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
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
                          Container(
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
                          Container(
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
      Container(
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

  Widget kitchenSetting() {
    //kitchen settings page
    return Container(
        child: Container(
      child: Column(
        children: [
          Container(
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
          Container(
              height:
                  MediaQuery.of(context).size.height / 1.40, //height of button
              width: MediaQuery.of(context).size.width / 1.1,
              //  color: Colors.red[100],
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.grey, width: .5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const ListTile(
                          title: Text("<Kitchen Name> "),
                        ));
                  })),
          Container(
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
      ),
    ));
  }

  setKitchen(int kitchen) {
    if (kitchen == 1) {
      return kitchenSetting();
    } else if (kitchen == 2) {
      return addKitchen();
    }
  }

  Widget kitchenSettings() {
    return Container(
      child: setKitchen(kitchen),
    );
  }

  Widget addKitchen() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Add Kitchen',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 1.40, //height of button
        width: MediaQuery.of(context).size.width / 1.1,
        // color: Colors.red[100],
        child: Column(
          children: [
            Container(
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
                    height: 6,
                  ),
                  const TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
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
                    height: 6,
                  ),
                  const TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
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
                      Container(
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
                            Container(
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
                                    title: Text('<Usb Printer>'),
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
                                    title: Text('<Bluetooth Printer>'),
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
      Container(
        // color: Colors.green,
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
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
    ]);
  }

  Widget organizations() {
    return Container(
      child: createOrganization(organization),
    );
  }

  Widget organizationList() {
    return Container(
      child: Container(
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
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
              Container(
                height: MediaQuery.of(context).size.height /
                    1.40, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                // color: Colors.red[100],
                // herr
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.grey, width: .5),
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
              Container(
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
          )),
    );
  }

  Widget createOrganizations() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 16, //height of button
        width: MediaQuery.of(context).size.width / 1,
        child: const Text('Create Organization',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      Container(
        //padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 4, //height of button
        width: MediaQuery.of(context).size.width / 1,
        //  color: Colors.red[100],
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 8,
              //color: Colors.white,
              height: MediaQuery.of(context).size.height / 6,
              child: SvgPicture.asset('assets/svg/Logo.svg'),
            ),
            Container(
              padding: EdgeInsets.all(5),
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
                      print("Upload Logo $imgName");
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
                  Text('Name', style: const TextStyle(fontSize: 15)),
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
      Container(
          height: MediaQuery.of(context).size.height / 1.8, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //color: Colors.red

          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.all(8),
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
                        Container(
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
                        Container(
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
                  Text('Gst', style: const TextStyle(fontSize: 15)),
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
              padding: EdgeInsets.all(8),
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
                    focusNode: organizationEmail,
                    controller: organizationEmailController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationPhone);
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
                  Text('Country', style: const TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationCountry,
                    controller: organizationCountryController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationCity);
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
                  const Text('City', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
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
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Province/State', style: TextStyle(fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  TextField(
                    focusNode: organizationState,
                    controller: organizationStateController,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(organizationPIN);
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

  createOrganization(int organization) {
    if (organization == 1) {
      return organizationList();
    } else if (organization == 2) {
      return createOrganizations();
    }
  }

  Widget usersList() {
    return Container(
      child: setUsers(user),
    );
  }

  setUsers(int user) {
    if (user == 1) {
      return userList();
    } else if (user == 2) {
      return addUser();
    }
  }

  Widget addUser() {
    return Container(
      child: Column(
        children: [
          Container(
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
            padding: EdgeInsets.all(16),
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
                Container(
                  height: MediaQuery.of(context).size.height /
                      12, //height of button
                  width: MediaQuery.of(context).size.width / 3,
                  // color:Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        child: const TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
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
                Container(
                  height: MediaQuery.of(context).size.height /
                      1.9, //height of button
                  width: MediaQuery.of(context).size.width / 3,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
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
                        padding: EdgeInsets.all(8),
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
                          padding: EdgeInsets.all(7),
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
                                value: diningswitch,
                                borderRadius: 20.0,
                                padding: 1.0,
                                activeColor: Colors.green,
                                activeTextColor: Colors.green,
                                inactiveTextColor: Colors.white,
                                inactiveColor: Colors.grey,
                                onToggle: (val) {
                                  setState(() {
                                    diningswitch = val;
                                    // printKitchen == true;
                                  });
                                },
                              ))
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height /
                              15, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Take Away',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
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
                          padding: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height /
                              15, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Online',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
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
                          padding: EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height /
                              15, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Car',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
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
          Container(
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
      ),
    );
  }

  Widget userList() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
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
            height:MediaQuery.of(context).size.height / 1.40, //height of button
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
                        title: Text("<User Name> "),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/arrow.svg'),
                        ),
                      ));
                }),
          ),
          Container(
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

  Widget contactUS() {
    return Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 16, //height of button
              width: MediaQuery.of(context).size.width / 1,

              child: const Text('Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.40, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                child:Text('Contact Details '))
          ],
        ));
  }

  Widget privacyPolicies() {
    return Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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
            Container(
                height: MediaQuery.of(context).size.height / 1.40, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                child:Text('Policies '))
          ],
        ));
  }

  Widget termsAndCondition() {
    return Container(
        child:  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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
        Container(
            height: MediaQuery.of(context).size.height / 1.40, //height of button
            width: MediaQuery.of(context).size.width / 1.1,



            )
      ],
    ));
  }

  Widget versionDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    Container(
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
    Container(
        height: MediaQuery.of(context).size.height / 1.40, //height of button
        width: MediaQuery.of(context).size.width / 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/Logo.svg'),
            const SizedBox(height: 8,),
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

  Widget languages() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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
        Container(
          height: MediaQuery.of(context).size.height / 1.40, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          // color: Colors.red[100],
          child: ListView(children: <Widget>[
            Card(
              color: Colors.grey[100],
              child: ListTile(
                title: Text('English'),
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
                  title: Text('Arabic'),
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

  test(int ind) {
    setState(() {
      if (ind == 1) {
        setting1 = Colors.white;
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 2) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Colors.white;
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 3) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Colors.white;
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 4) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Colors.white;
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 5) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Colors.white;
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 6) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Colors.white;
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 7) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Colors.white;
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 8) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Colors.white;
        setting9 = Color(0xffF3F3F3);
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 9) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Colors.white;
        setting10 = Color(0xffF3F3F3);
      } else if (ind == 10) {
        setting1 = Color(0xffF3F3F3);
        setting2 = Color(0xffF3F3F3);
        setting3 = Color(0xffF3F3F3);
        setting4 = Color(0xffF3F3F3);
        setting5 = Color(0xffF3F3F3);
        setting6 = Color(0xffF3F3F3);
        setting7 = Color(0xffF3F3F3);
        setting8 = Color(0xffF3F3F3);
        setting9 = Color(0xffF3F3F3);
        setting10 = Colors.white;
      } else if (ind == 11) {
        setting11 = Colors.white;
      }
    });
  }

  Widget settingsList() {
    return ListView(children: <Widget>[
      Card(
        color: setting1,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          title: const Text('Kitchen setings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
      Card(
        color: setting4,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
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
          side: BorderSide(color: Color(0xffDFDFDF), width: 1),
          borderRadius: BorderRadius.circular(2),
        ),
        child: ListTile(
          onTap: () async {
            ConfirmAction? action = await _asyncConfirmDialog(context);
            if (action == ConfirmAction.Accept) {
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

  selectSettingList(int index) {
    if (index == 1) {
      return generalSettings();
    } else if (index == 2) {
      return printerSettings();
    } else if (index == 3) {
      return kitchenSettings();
    } else if (index == 4) {
      return organizations();
    } else if (index == 5) {
      return usersList();
    } else if (index == 6) {
      return contactUS();
    } else if (index == 7) {
      return privacyPolicies();
    } else if (index == 8) {
      return termsAndCondition();
    } else if (index == 9) {
      return versionDetail();
    } else if (index == 10) {
      return languages();
    } else {
      return generalSettings();
    }
  }
}

enum ConfirmAction { Cancel, Accept }

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
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          TextButton(
            child: const Text('Log out'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}

enum Image { Gallery, Camera }

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
                Navigator.pop(context, Image.Gallery);
              },
              child: const Text('Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Image.Camera);
              },
              child: const Text('Camera'),
            ),
          ],
        );
      });
}
