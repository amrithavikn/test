import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/screen/dashboard.dart';

class CustomerDetails extends StatefulWidget {
  CustomerDetails({Key? key}) : super(key: key);

  //final String title;

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  late TextEditingController _nameController;
  late TextEditingController _nameSuffixController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressCityController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameSuffixController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressCityController = TextEditingController();
  }

  Color color1 = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
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
                child: Container(
                  height:
                      MediaQuery.of(context).size.height / 1, //height of button
                  width: MediaQuery.of(context).size.width / 2.4,
                  //color: Colors.red[100],
                  child: Column(
                    children: [
                      Container(
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
                      Container(
                        height: MediaQuery.of(context).size.height /
                            1.5, //height of button
                        width: MediaQuery.of(context).size.width / 1.1,
                        // color: Colors.yellow[100],
                        child: Row(
                          children: [
                            Container(
                              //image
                              padding: EdgeInsets.all(40.0),
                              height: MediaQuery.of(context).size.height /
                                  1.6, //height of button
                              width: MediaQuery.of(context).size.width / 3.2,
                              // color: Colors.purple[100],
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // SizedBox(height: 30),
                                    SvgPicture.asset('assets/svg/Logo.svg',
                                        fit: BoxFit.fill),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          color1 = Colors.orange;
                                          //color2 = Colors.transparent;
                                        });

                                        final Image? imgName =
                                            await _asyncSimpleDialog(context);
                                        print("Upload Images is $imgName");
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
                            Container(
                              //textfield
                              height: MediaQuery.of(context).size.height /
                                  1.6, //height of button
                              width: MediaQuery.of(context).size.width / 3,
                              //color: Colors.deepOrange[100],
                              child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  //  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      padding: new EdgeInsets.all(10.0),
                                      child: Form(
                                        key: _formKey,
                                        child: Container(
                                          padding: EdgeInsets.all(16),
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
                                                TextFormField(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text("Last Name",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    )),
                                                TextFormField(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text("Email",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    )),
                                                TextFormField(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text("Phone Number",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    )),
                                                TextFormField(
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
                            )
                          ],
                        ),
                      ),
                      Container(
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
                        Container(
                          height: MediaQuery.of(context).size.height /
                              10, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          //color: Colors.red[100],
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              1.5, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          // color: Colors.purple[100],),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    child: ListTile(
                                  leading: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/svg/customer.svg'),
                                      iconSize: 40,
                                    ),
                                  ),
                                  title: Text("<Customer Name>"),
                                  subtitle: Text('<Phone Number>'),
                                ));
                              }),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              10, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          // color: Colors.red[100],
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
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
