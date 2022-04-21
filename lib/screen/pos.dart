import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class POS extends StatefulWidget {
  const POS({Key? key}) : super(key: key);

  @override
  State<POS> createState() => _POSPageState();
}

class _POSPageState extends State<POS> {
  Color color1 = Colors.white;
  Color color2 = const Color(0xffF8F8F8);
  Color color3 = const Color(0xffF8F8F8);
  Color color4 = const Color(0xffF8F8F8);
  Color borderColor1 = Colors.black;
  Color borderColor2 = Colors.transparent;
  Color borderColor3 = Colors.transparent;
  Color borderColor4 = Colors.transparent;
  Color pageButton1 = Colors.black;
  Color pageButton2 = Colors.white;
  Color pageButton3 = Colors.white;
  Color pageButton4 = Colors.white;
  Color pageButtonColor1 = Colors.black;
  Color pageButtonColor2 = Colors.white;
  Color pageButtonTextColor1 = Colors.black;
  Color pageButtonTextColor2 = Colors.white;
  var page = 1;
  bool buttonStyle = true;

  var index = 1;
  var order = 1;
  String dropDown = 'A/C Room';

  bool payment = false;
  bool veg = false;
  bool paymentOption = false;

  bool addTable = true;
  bool foodDescription = false;

  // List of items in our dropdown menu
  var items = [
    'A/C Room',
    'A/C Room 2',
    'Non A/CRoom',
    'Non A/CRoom1',
    'Non A/CRoom2',
  ];

  TextEditingController suffixController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  FocusNode suffix = FocusNode();
  FocusNode name = FocusNode();
  FocusNode no = FocusNode();
  FocusNode amount = FocusNode();
  FocusNode cardType = FocusNode();
  FocusNode cardNo = FocusNode();
  FocusNode discount = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Row(
            children: [
              Container(
                height:
                    MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                //  color: Colors.grey,
                child: selectTable(index),

                //color: Colors.red[100],
              ),
              Container(
                height:
                    MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 11,
                // color: Colors.cyanAccent[100],
                child: chooseFoodOrder(),
              )
            ],
          ),
        ));
  }

  Widget paymentMethod() {
    return Container(
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.1,
            //height of button
            width: MediaQuery.of(context).size.width / 1.7,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .2)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(9),
                  height: MediaQuery.of(context).size.height / 15,
                  //height of button
                  width: MediaQuery.of(context).size.width / 1.7,
                  //  color: Colors.grey,
                  child: const Text(
                    'Payment',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),

                  height: MediaQuery.of(context).size.height / 14,
                  //height of button
                  width: MediaQuery.of(context).size.width / 1.8,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height /
                            13, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Text('To Be Paid',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height /
                            13, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: const Text(
                          'Rs.2123.00',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border.all(color: Colors.grey, width: .2)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      1.5, //height of button
                  width: MediaQuery.of(context).size.width / 1.4,
                  //  color: Colors.grey,
                  child: Row(
                    children: [
                      Container(
                        //cashh
                        height: MediaQuery.of(context).size.height /
                            1.5, //height of button
                        width: MediaQuery.of(context).size.width / 3.6,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 15,
                              child: const Text(
                                'Cash',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // color: Colors.grey,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('5')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: const Text('10')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('100')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('200')),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              //color: Colors.yellow,
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('20')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('50')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('500')),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Color(0xff262626),
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        onPressed: () {},
                                        child: Text('1000')),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height: MediaQuery.of(context).size.height / 18,
                                //   color: Colors.red,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                14,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        child: const Text(
                                          'Total Cash:',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                11,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        child: const TextField(
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(11),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffBFBFBF),
                                                    width: .1)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                9,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              //    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  22))),

                                              primary: Colors.white,
                                              backgroundColor:
                                                  const Color(0xff10C103),
                                              textStyle: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            onPressed: () {},
                                            child:
                                                const Text('pay full in cash')),
                                      )
                                    ])
                                // color: Colors.grey,
                                )
                          ],
                        ),
                        //color: Colors.grey,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            1.5, //height of button
                        width: MediaQuery.of(context).size.width / 3.7,
                        //bank
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 15,
                              child: const Text(
                                'Bank',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // color: Colors.grey,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height: MediaQuery.of(context).size.height / 18,
                                //  color:Colors.grey,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      //color: Colors.grey,
                                      child: const Text(
                                        'Amount:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: TextField(
                                        focusNode: amount,
                                        controller: amountController,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(cardType);
                                        },
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffBFBFBF),
                                                  width: .1)),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height: MediaQuery.of(context).size.height / 18,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      // color: Colors.grey,
                                      child: const Text(
                                        'Card Type:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: TextField(
                                        focusNode: cardType,
                                        controller: cardTypeController,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(cardNo);
                                        },
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height: MediaQuery.of(context).size.height / 18,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      //color: Colors.grey,
                                      child: const Text(
                                        'Card No:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: TextField(
                                        focusNode: cardNo,
                                        controller: cardNoController,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(discount);
                                        },
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 3.6,
                                height: MediaQuery.of(context).size.height / 18,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: const Text(
                                        'Discount:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: TextField(
                                        focusNode: discount,
                                        controller: discountController,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width /
                                          16,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor:
                                                const Color(0xffF38811),
                                            textStyle: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          onPressed: () {},
                                          child: const Text('To items')),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      12, //height of button
                  width: MediaQuery.of(context).size.width / 1.7,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: Colors.white,
                              backgroundColor: const Color(0xffFF0000),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            child: const Text('Cancel')),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: Colors.white,
                              backgroundColor: const Color(0xff1155F3),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            child: const Text('Print&Save')),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: Colors.white,
                              backgroundColor: const Color(0xff0A9800),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            child: const Text('Save')),
                      )
                    ],
                  ),
                ),
              ],
            ),
            //color: Colors.grey,
          ),
          Container(
              height:
                  MediaQuery.of(context).size.height / 1.1, //height of button
              width: MediaQuery.of(context).size.width / 3.3,

              // color: Colors.purple[100],
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 13,
                    //height of button
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.white,
                    child: const TextField(
                        decoration: InputDecoration(
                      hintText: 'Search',
                      isDense: true,
                      border: OutlineInputBorder(),
                    )
                        // contentPadding: EdgeInsets.all(30)),
                        ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height /
                        1.35, //height of button
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(1),
                            height: MediaQuery.of(context).size.height /
                                10, //height of button
                            width: MediaQuery.of(context).size.width / 2.5,
                            //
                            child: Row(children: [
                              Container(
                                  padding: EdgeInsets.all(3),
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  //height of button
                                  width: MediaQuery.of(context).size.width / 9,
                                  child: Column(
                                    //  mainAxisSize: MainAxisSize.max,
                                    //alignment changed
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        'plate mexican beef shawarma ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Description',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: .2))
                                  //color: Colors.orange,
                                  ),
                              Container(
                                  padding: EdgeInsets.all(3),
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  //height of button
                                  width: MediaQuery.of(context).size.width / 13,
                                  //color: Colors.grey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text('Rate ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text('Quantity',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text('Extra Spicy',
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .2),
                                  )),
                              Container(
                                padding: EdgeInsets.all(3),
                                height: MediaQuery.of(context).size.height / 10,
                                //height of button
                                width: MediaQuery.of(context).size.width / 13,
                                //  color: Colors.green,

                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text('Tax',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12)),
                                    Text('Gross amt',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12)),
                                    Text('Net total:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .2)),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height /
                                    10, //height of button
                                width: MediaQuery.of(context).size.width / 28,
                                color: Colors.red,
                                child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset('assets/svg/clear.svg'),
                                ),
                              ),
                            ]),
                          );
                        }),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: .2)))
        ],
      ),
    );
  }

  Widget chooseTable() {
    //create table
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13, //height of button
          width: MediaQuery.of(context).size.width / 1,
          //color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height:
                    MediaQuery.of(context).size.height / 11, //height of button
                width: MediaQuery.of(context).size.width / 3,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dining',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff717171),
                          fontSize: 15),
                    ),
                    Text(
                      'Choose a Table',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                          fontSize: 11.0),
                    )
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.height /
                      11, //height of button
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Savadh Farooque'),
                      IconButton(
                          icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                          onPressed: () {}),
                    ],
                  ))
            ],
          ),
        ),
        Container(
          // color: Colors.greenAccent,
          height: MediaQuery.of(context).size.height / 1.6, //height of button
          width: MediaQuery.of(context).size.width / 1,
          // color: Colors.grey,),
          child: GridView.builder(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff8D8D8D))),
                    child: Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: IconButton(
                              onPressed: () {
                                setState(() {
                                  // addTable = false;
                                });
                              },
                              icon: SvgPicture.asset('assets/svg/table.svg'),
                              iconSize: 50,
                            ),
                            title: const Text('Table 1',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: .5)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 20,
                          // color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 15,
                                height: MediaQuery.of(context).size.height / 25,
                                child: const Text('To Be Paid:',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 15,
                                height: MediaQuery.of(context).size.height / 25,
                                child: Text('-'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(20.0),
                              primary: Colors.white,
                              backgroundColor: buttonColor(index),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  addTable = false;
                                });
                              });
                            },
                            child: Text(buttonText(index)),
                          ),
                        ),
                      ],
                    ));
              }),
        ),
        Container(
            child: Row(
          children: [
            Container(
              child: addTable == true ? createTables() : orderedMenu(),
            )
          ],
        )),
        Container(
          //add and remove tablee
          height: MediaQuery.of(context).size.height / 12, //height of button
          width: MediaQuery.of(context).size.width / 1,
          // color: Colors.green[200],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:
                    MediaQuery.of(context).size.height / 12, //height of button
                width: MediaQuery.of(context).size.width / 18,

                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/addmore.svg',
                    ),
                    iconSize: 35),
              ),
              Container(
                padding: EdgeInsets.all(18),
                height:
                    MediaQuery.of(context).size.height / 14, //height of button
                width: MediaQuery.of(context).size.width / 10,

                child: const Text('Add Table', style: TextStyle(fontSize: 13)),
              ),
              Container(
                height:
                    MediaQuery.of(context).size.height / 12, //height of button
                width: MediaQuery.of(context).size.width / 18,
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/remove.svg',
                    ),
                    iconSize: 35),
              ),
              Container(
                padding: EdgeInsets.all(18),
                height:
                    MediaQuery.of(context).size.height / 14, //height of button
                width: MediaQuery.of(context).size.width / 8,
                child:
                    const Text('Remove Table', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget orderedMenu() {
    //heree oder confirmm action
    return Container(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 18,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            addTable = true;
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/printer.svg',
                        ),
                        iconSize: 40),
                    const Text('Print', style: TextStyle(fontSize: 13)),
                  ])),
          Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 12,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/cancelorder.svg',
                        ),
                        iconSize: 40),
                    const Text('Cancel Order', style: TextStyle(fontSize: 13)),
                  ])),
          Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 18,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            paymentOption = true;
                            index = 6;
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/pay.svg',
                        ),
                        iconSize: 40),
                    const Text('Pay', style: TextStyle(fontSize: 13)),
                  ])),
          paymentOption == true
              ? Container(child: paymentMethod())
              : Container(),

//here
        ],
      ),
    );
  }

  showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  const SizedBox(
                    height: 4,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Phone'),
                  const SizedBox(
                    height: 4,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Location'),
                  const SizedBox(
                    height: 4,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: Colors.white,
                              backgroundColor: const Color(0xffFF0000),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            child: const Text('Cancel')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 10,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(15.0),
                              primary: Colors.white,
                              backgroundColor: const Color(0xff12AA07),
                              textStyle: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            child: const Text('Save')),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget takeAway() {
    return Container(
      child: Column(
        children: [
          //heading container
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 13, //height of button
            width: MediaQuery.of(context).size.width / 1,
            //color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height /
                      11, //height of button
                  width: MediaQuery.of(context).size.width / 3,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Take Away',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff717171),
                            fontSize: 15),
                      ),
                      Text(
                        'Create a Parcel',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            fontSize: 11.0),
                      )
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    height: MediaQuery.of(context).size.height /
                        11, //height of button
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Savadh Farooque'),
                        IconButton(
                            icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                            onPressed: () {}),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.1, //height of button
            width: MediaQuery.of(context).size.width / 1.1,

            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.49,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height /
                            4.5, //height of button
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              DottedBorder(
                                color: Color(0xff8D8D8D),
                                strokeWidth: 1,
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      7, //height of button
                                  width:
                                      MediaQuery.of(context).size.width / 4.9,

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: SvgPicture.asset(
                                                        'assets/svg/takeaway.svg'),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Parcel $index',
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff000000)),
                                                      ),
                                                      const Text('savadh ',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff2B2B2B))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text('Rs.23455',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff005B37))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        //alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                34, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Token',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '002',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        //alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                35, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Phone',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '+91 9898989765',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        //color: Colors.blueGrey,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                35, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: const Text(
                                          '23 Minutes Ago',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff929292)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                height: MediaQuery.of(context).size.height /
                                    18, //height of button
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Color(0xff03C1C1),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Ordered',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              // ListTile(),
                            ],
                          ),
                        ),
                      );
                    }),
                DottedBorder(
                  color: Color(0xff8D8D8D),
                  strokeWidth: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 4.5,
                    //height of button
                    width: MediaQuery.of(context).size.width / 4.5,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        //  padding: EdgeInsets.all(7),
                        height: MediaQuery.of(context).size.height /
                            25, //height of button
                        width: MediaQuery.of(context).size.width / 25,

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget carMethod() {
    return Container(
      child: Column(
        children: [
          //heading container
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 13, //height of button
            width: MediaQuery.of(context).size.width / 1,
            //color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height /
                      11, //height of button
                  width: MediaQuery.of(context).size.width / 3,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Car',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff717171),
                            fontSize: 15),
                      ),
                      Text(
                        'Create a Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            fontSize: 11.0),
                      )
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    height: MediaQuery.of(context).size.height /
                        11, //height of button
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Savadh Farooque'),
                        IconButton(
                            icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                            onPressed: () {}),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.1, //height of button
            width: MediaQuery.of(context).size.width / 1.1,

            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.49,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height /
                            4.5, //height of button
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Card(
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              DottedBorder(
                                color: Color(0xff8D8D8D),
                                strokeWidth: 1,
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      7, //height of button
                                  width: MediaQuery.of(context).size.width / 5,

                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: ListTile(
                                          leading: IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                'assets/svg/car.svg'),
                                          ),
                                          title: Text(
                                            'Car $index',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000)),
                                          ),
                                          subtitle: const Text('savadh ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff2B2B2B))),
                                          trailing: const Text('Rs.23455',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff005B37))),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                28, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              'Phone',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '+91 9898989765',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        //color: Colors.blueGrey,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                30, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: const Text(
                                          '23 Minutes Ago',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff929292)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //
                              Container(
                                padding: EdgeInsets.all(4),
                                height: MediaQuery.of(context).size.height /
                                    18, //height of button
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Color(0xff03C1C1),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Ordered',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              // ListTile(),
                            ],
                          ),
                        ),
                      );
                    }),
                DottedBorder(
                  color: Color(0xff8D8D8D),
                  strokeWidth: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 4.5,
                    //height of button
                    width: MediaQuery.of(context).size.width / 4.5,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        //  padding: EdgeInsets.all(7),
                        height: MediaQuery.of(context).size.height /
                            25, //height of button
                        width: MediaQuery.of(context).size.width / 25,

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createTables() {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3,
        color: Color(0xffEBEBEB),
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Create Table',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: MediaQuery.of(context).size.height /
                        16, //height of button
                    width: MediaQuery.of(context).size.width / 9,
                    child: TextField(
                      controller: suffixController,
                      focusNode: suffix,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(name);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Suffix',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    // color: Colors.red,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    height: MediaQuery.of(context).size.height /
                        16, //height of button
                    width: MediaQuery.of(context).size.width / 11,
                    child: TextField(
                      controller: nameController,
                      focusNode: name,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(no);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    //  color: Colors.yellowAccent,
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    height: MediaQuery.of(context).size.height /
                        16, //height of button
                    width: MediaQuery.of(context).size.width / 15,
                    child: TextField(
                      focusNode: no,
                      decoration: const InputDecoration(
                        hintText: 'No',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    // color: Colors.grey,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height /
                        20, //height of button
                    width: MediaQuery.of(context).size.width / 20,

                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        // color: c1,
                        border: Border.all(color: Colors.grey)),
                  ),

                  // color: Colors.green,
                ],
              ),
            ),
            Row(children: [
              const Text('Price Category', style: TextStyle(fontSize: 13)),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height / 17,
                //height of button
                width: MediaQuery.of(context).size.width / 6,
                child: DropdownButton(
                  value: dropDown,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDown = newValue!;
                    });
                  },
                ),
              ),
            ]),
          ],
        ));
  }

  Widget onlineMethod() {
    return Container(
      child: Column(
        children: [
          //heading container
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 13, //height of button
            width: MediaQuery.of(context).size.width / 1,
            //color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height /
                      11, //height of button
                  width: MediaQuery.of(context).size.width / 3,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Online',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff717171),
                            fontSize: 15),
                      ),
                      Text(
                        'Create a Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            fontSize: 11.0),
                      )
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    height: MediaQuery.of(context).size.height /
                        11, //height of button
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Savadh Farooque'),
                        IconButton(
                            icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                            onPressed: () {}),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.1, //height of button
            width: MediaQuery.of(context).size.width / 1.1,

            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.49,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height /
                            4.5, //height of button
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              DottedBorder(
                                color: Color(0xff8D8D8D),
                                strokeWidth: 1,
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      7, //height of button
                                  width:
                                      MediaQuery.of(context).size.width / 4.9,

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: SvgPicture.asset(
                                                        'assets/svg/online.svg'),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Order $index',
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff000000)),
                                                      ),
                                                      const Text('savadh ',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff2B2B2B))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text('Rs.23455',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff005B37))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        //alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                35, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Phone',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '+91 9898989765',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        //color: Colors.blueGrey,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        //alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                34, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'Ponoor',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff4E4E4E),
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                35, //height of button
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: const Text(
                                          '23 Minutes Ago',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff929292)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                height: MediaQuery.of(context).size.height /
                                    18, //height of button
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Color(0xff03C1C1),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Ordered',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                              // ListTile(),
                            ],
                          ),
                        ),
                      );
                    }),
                DottedBorder(
                  color: Color(0xff8D8D8D),
                  strokeWidth: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 4.5,
                    //height of button
                    width: MediaQuery.of(context).size.width / 4.5,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        //  padding: EdgeInsets.all(7),
                        height: MediaQuery.of(context).size.height /
                            25, //height of button
                        width: MediaQuery.of(context).size.width / 25,

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addFlavour() {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1, //height of button
          width: MediaQuery.of(context).size.width / 1.8,

          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(6),
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height /
                            16, //height of button
                        width: MediaQuery.of(context).size.width / 11,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Table 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff717171),
                                  fontSize: 15),
                            ),
                            Text(
                              'Choose Items',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                  fontSize: 11.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height /
                            16, //height of button
                        width: MediaQuery.of(context).size.width / 6,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color(0xffFFFFFF),
                            backgroundColor:
                                Color(0xff172026), // Background Color
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset('assets/svg/person.svg'),
                                iconSize: 40,
                                onPressed: () {
                                  setState(() {
                                    showAlert();
                                  });
                                },
                              ),
                              const Text(
                                'Add Customer',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 1.7,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width / 2.5,
                      //  color: Colors.grey,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'Add item',
                            isDense: true,
                            fillColor: Color(0xffFFFFFF),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(11)),
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.width / 15,
                            child: const Text(
                              'Veg Only',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.width / 15,
                            child: FlutterSwitch(
                              width: 40.0,
                              height: 20.0,
                              valueFontSize: 30.0,
                              toggleSize: 15.0,
                              value: veg,
                              borderRadius: 20.0,
                              padding: 1.0,
                              activeColor: Colors.green,
                              activeTextColor: Colors.green,
                              inactiveTextColor: Colors.white,
                              inactiveColor: Colors.grey,
                              onToggle: (val) {
                                setState(() {
                                  veg = val;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height:
                    MediaQuery.of(context).size.height / 7, //height of button
                width: MediaQuery.of(context).size.width / 1.7,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 7,
                      //height of button
                      width: MediaQuery.of(context).size.width / 26,
                      color: Color(0xffF25F29),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height /
                          1.6, //height of button
                      width: MediaQuery.of(context).size.width / 2.1,

                      child: GridView.builder(
                          padding: EdgeInsets.all(6),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 3.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return TextButton(
                                style: TextButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  backgroundColor: Color(0xff172026),
                                  side: const BorderSide(
                                      color: Color(0xffB8B8B8), width: .1),
                                  textStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {},
                                child: Text("Catagery $index"));
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 7,
                      //height of button
                      width: MediaQuery.of(context).size.width / 26,
                      color: Color(0xffF25F29),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height /
                      1.8, //height of button
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.3, //2.4 will workk
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: MediaQuery.of(context).size.height /
                              8.5, //height of button
                          width: MediaQuery.of(context).size.width / 6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xffC9C9C9),
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                      5.0) //                 <--- border radius here
                                  )),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height /
                                    8.6, //height of button
                                width: MediaQuery.of(context).size.width / 15,

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: .1,
                                      color: Color(0xffC9C9C9),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            5.0) //                 <--- border radius here
                                        )),

                                child: SvgPicture.asset('assets/svg/Logo.svg'),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height /
                                    8.5, //height of button
                                width: MediaQuery.of(context).size.width / 11,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16, //height of button
                                      width: MediaQuery.of(context).size.width /
                                          12,
                                      child: const Text(
                                        'plate mexican beef shawarma ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20, //height of button
                                      width: MediaQuery.of(context).size.width /
                                          12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Rs.95 ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40, //height of button
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 1)),
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              child: const Icon(
                                                Icons.circle,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // color: Colors.orange,
                              )
                            ],
                          ),
                        );
                      })),
              Container(
                height:
                    MediaQuery.of(context).size.height / 9, //height of button
                width: MediaQuery.of(context).size.width / 1.7,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 11,
                      //height of button
                      width: MediaQuery.of(context).size.width / 26,
                      color: Color(0xff172026),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      height: MediaQuery.of(context).size.height /
                          1.6, //height of button
                      width: MediaQuery.of(context).size.width / 2.1,

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50, // <-- Your width
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: pageButton1),
                              child: const Text(
                                '1',
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                setState(() {
                                  pageButton1 = Colors.black;
                                  pageButton2 = Colors.white;
                                  pageButton3 = Colors.white;
                                  pageButton4 = Colors.white;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50, // <-- Your width
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: pageButton2),
                              child: const Text(
                                '2',
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                setState(() {
                                  pageButton1 = Colors.white;
                                  pageButton2 = Colors.black;
                                  pageButton3 = Colors.white;
                                  pageButton4 = Colors.white;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50, // <-- Your width
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: pageButton3),
                              child: const Text(
                                '3',
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                setState(() {
                                  pageButton1 = Colors.white;
                                  pageButton2 = Colors.white;
                                  pageButton3 = Colors.black;
                                  pageButton4 = Colors.white;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50, // <-- Your width
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: pageButton4),
                              child: const Text(
                                '4',
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {
                                setState(() {
                                  pageButton1 = Colors.white;
                                  pageButton2 = Colors.white;
                                  pageButton3 = Colors.white;
                                  pageButton4 = Colors.black;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 11,
                      //height of button
                      width: MediaQuery.of(context).size.width / 26,
                      color: Color(0xff172026),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: ordersList(order),
        ),
      ],
    );
  }

  ordersList(int order) {
    if (order == 1) {
      return orderList();
    } else if (order == 2) {
      return chooseFlavour();
    } else if (order == 3) {
      return addFlavourDetails();
    } else
      return orderList();
  }

  Widget orderList() {
    return Container(
      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
              alignment: Alignment.bottomCenter,
              height:
                  MediaQuery.of(context).size.height / 11, //height of button
              width: MediaQuery.of(context).size.width / 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Savadh Farooque'),
                  IconButton(
                      icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                      onPressed: () {}),
                ],
              )),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 13,
            //height of button
            width: MediaQuery.of(context).size.width / 2.5,
            color: Colors.white,
            child: const TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  isDense: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5
            //1.35
            , //height of button
            width: MediaQuery.of(context).size.width / 2.5,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(1),
                    height: MediaQuery.of(context).size.height / 13,
                    //height of button
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Color(0xffFFFFFF),
                    //
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            order = 2;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(3),
                            height: MediaQuery.of(context).size.height / 10,
                            //height of button
                            width: MediaQuery.of(context).size.width / 9,
                            child: Column(
                              //  mainAxisSize: MainAxisSize.max,
                              //alignment changed
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'plate mexican beef shawarma ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: .2))
                            //color: Colors.orange,
                            ),
                      ),
                      Container(
                          padding: EdgeInsets.all(3),
                          height: MediaQuery.of(context).size.height / 10,
                          //height of button
                          width: MediaQuery.of(context).size.width / 13,
                          //color: Colors.grey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Rate ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                              Text('Quantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                              Text('Extra Spicy',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13))
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: .2),
                          )),
                      Container(
                        padding: EdgeInsets.all(3),
                        height: MediaQuery.of(context).size.height / 10,
                        //height of button
                        width: MediaQuery.of(context).size.width / 13,
                        //  color: Colors.green,

                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('Tax',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13)),
                            Text('Gross amt',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13)),
                            Text('Net total:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13))
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: .2)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height /
                            10, //height of button
                        width: MediaQuery.of(context).size.width / 28,
                        color: Colors.red,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/clear.svg'),
                        ),
                      ),
                    ]),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(4),
            //   color: Colors.grey,
            height: MediaQuery.of(context).size.height / 7,
            //height of button
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 30,
                  //height of button
                  width: MediaQuery.of(context).size.width / 2.5,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Tax',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      Text('Rs.2123.00',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 27,
                  //height of button
                  width: MediaQuery.of(context).size.width / 2.5,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'To be Paid',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        'Rs.2123.00',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  //height of button
                  width: MediaQuery.of(context).size.width / 2.5,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          //height of button
                          width: MediaQuery.of(context).size.width / 7,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color(0xffFFFFFF),
                              backgroundColor:
                                  const Color(0xffFF0000), // Background Color
                            ),
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/svg/clear.svg'),
                                    iconSize: 40,
                                    onPressed: () {},
                                  ),
                                  const Text(
                                    'Cancel',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          //height of button
                          width: MediaQuery.of(context).size.width / 7,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color(0xffFFFFFF),
                              backgroundColor:
                                  const Color(0xff10C103), // Background Color
                            ),
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/svg/check.svg'),
                                    iconSize: 40,
                                    onPressed: () {},
                                  ),
                                  const Text(
                                    'Save',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget chooseFlavour() {
    return Container(
      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,

      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,

            height: MediaQuery.of(context).size.height / 30, //height of button
            width: MediaQuery.of(context).size.width / 5,
            child: Text(
              'qty',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF25F29)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 15, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height /
                      14, //height of button
                  width: MediaQuery.of(context).size.width / 9,
                  child: const Text(
                    'Plate Mexican beef Shawarma',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      13, //height of button
                  width: MediaQuery.of(context).size.width / 7,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,

                        height: MediaQuery.of(context).size.height / 20,
                        //height of button
                        width: MediaQuery.of(context).size.width / 29,
                        decoration: const BoxDecoration(
                            color: Color(0xffF25F29),
                            borderRadius: BorderRadius.all(Radius.circular(3))),

                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.minimize),
                          color: Color(0xffFFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height /
                            17, //height of button
                        width: MediaQuery.of(context).size.width / 17,
                        child: const TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.center,

                        height: MediaQuery.of(context).size.height / 20,
                        //height of button
                        width: MediaQuery.of(context).size.width / 29,
                        decoration: const BoxDecoration(
                            color: Color(0xffF25F29),
                            borderRadius: BorderRadius.all(Radius.circular(3))),

                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          color: Color(0xffFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 30, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Text(
              'Description',
              style: TextStyle(
                  color: Color(0xff717171),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 17, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      17, //height of button
                  width: MediaQuery.of(context).size.width / 7,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xffF25F29),
                        textStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          order = 3;
                        });
                      },
                      child: Text('Add Flavour')),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height /
                      17, //height of button
                  width: MediaQuery.of(context).size.width / 13,
                  child: Text(
                    'Rate:',
                    style: TextStyle(
                        color: Color(0xffF25F29),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      17, //height of button
                  width: MediaQuery.of(context).size.width / 10,
                  child: const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Full'),
                      trailing: Text('Rs.400.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Half'),
                      trailing: Text('Rs.230.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Quarter'),
                      trailing: Text('Rs.150.00'),
                    ),
                  ),
                ),
              ])),
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 25, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Add Starter',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Clear',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.green),
                )
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Full'),
                      trailing: Text('Rs.400.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Half'),
                      trailing: Text('Rs.230.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Quarter'),
                      trailing: Text('Rs.150.00'),
                    ),
                  ),
                ),
              ])),
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 25, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Add Dishes',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Clear',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.green),
                )
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Full'),
                      trailing: Text('Rs.400.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Half'),
                      trailing: Text('Rs.230.00'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      15, //height of button
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: Card(
                    child: ListTile(
                      leading: GestureDetector(
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
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: Text('Quarter'),
                      trailing: Text('Rs.150.00'),
                    ),
                  ),
                ),
              ])),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 14, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      22, //,height of button
                  width: MediaQuery.of(context).size.width / 6.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: Color(0xffFF0000),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 6.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: Color(0xff309E10),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text('Save',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget addFlavourDetails() {
    return Container(
      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 22, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Text(
              'Flavour',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff717171)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 26, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Text(
              'Choose a Flavour',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 8, //height of button
            width: MediaQuery.of(context).size.width / 2.8,

            child: const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Search or Add Flavour',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5, //height of button
            width: MediaQuery.of(context).size.width / 2.8,

            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListView(shrinkWrap: true, children: const <Widget>[
                    Card(
                        color: Color(0xffEEEEEE),
                        child: ListTile(title: Text('Flavour Name'))),
                    Card(
                        color: Color(0xffEEEEEE),
                        child: ListTile(title: Text('Flavour Name'))),
                    Card(
                        color: Color(0xffEEEEEE),
                        child: ListTile(title: Text('Flavour Name'))),
                  ]);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 14, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 8,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: Color(0xffFF0000),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 8,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: Color(0xff309E10),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text('Add Flavour',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buttonList(int index) {
    if (index == 1) {
      return createTables();
    } else if (index == 2) {
      return orderedMenu();
    } else
      (Container());
  }

  selectTable(int index) {
    if (index == 1) {
      paymentOption = false;
      foodDescription = false;
      return chooseTable();
    } else if (index == 2) {
      paymentOption = false;
      foodDescription = false;
      return takeAway();
    } else if (index == 3) {
      paymentOption = false;
      foodDescription = false;
      return onlineMethod();
    } else if (index == 4) {
      return addFlavour();
    } else if (index == 6) {
      foodDescription = false;
      return paymentMethod();
    } else {
      return Container();
    }
  }

  buttonColor(int index) {
    if (index == 0) {
      return Color(0xffE5E5E5);
    } else if (index == 1) {
      return Color(0xff03C1C1);
    } else if (index == 2) {
      return Color(0xff034FC1);
    } else if (index == 3) {
      return Color(0xff10C103);
    } else {
      return Colors.grey;
    }
  }

  buttonText(int index) {
    if (index == 0) {
      return "Vaccant";
    } else if (index == 1) {
      return "Ordered";
    } else if (index == 2) {
      return "Billed";
    } else if (index == 3) {
      return "Paid";
    } else {
      return "";
    }
  }

  Widget chooseFoodOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor1,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: color1,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                color1 = Colors.white;
                color2 = Color(0xffF8F8F8);
                color3 = Color(0xffF8F8F8);
                color4 = Color(0xffF8F8F8);
                borderColor1 = Colors.black;
                borderColor2 = Colors.transparent;
                borderColor3 = Colors.transparent;
                borderColor4 = Colors.transparent;
                index = 1;
              });
            },
            icon: SvgPicture.asset('assets/svg/dining.svg'),
          ),
        ),
        const SizedBox(height: 3),
        const Text('Dining',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12)),
        const SizedBox(
          height: 6,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor2,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color2,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  color1 = Color(0xffF8F8F8);
                  color2 = Colors.white;
                  color3 = Color(0xffF8F8F8);
                  color4 = Color(0xffF8F8F8);
                  borderColor2 = Colors.black;
                  borderColor1 = Colors.transparent;
                  borderColor3 = Colors.transparent;
                  borderColor4 = Colors.transparent;
                  index = 2;
                });
              },
              icon: SvgPicture.asset('assets/svg/takeaway.svg'),
            )),
        const SizedBox(height: 3),
        const Text('Take Away',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12)),
        const SizedBox(
          height: 6,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor3,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color3,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  color1 = Color(0xffF8F8F8);
                  color2 = Color(0xffF8F8F8);
                  color3 = Colors.white;
                  color4 = Color(0xffF8F8F8);
                  borderColor2 = Colors.transparent;
                  borderColor1 = Colors.transparent;
                  borderColor3 = Colors.black;
                  borderColor4 = Colors.transparent;
                  index = 3;
                });
              },
              icon: SvgPicture.asset('assets/svg/online.svg'),
            )),
        const SizedBox(height: 3),
        const Text('Online',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12)),
        const SizedBox(
          height: 6,
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor4,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color4,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  color1 = Color(0xffF8F8F8);
                  color2 = Color(0xffF8F8F8);
                  color4 = Colors.white;
                  color3 = Color(0xffF8F8F8);
                  borderColor2 = Colors.transparent;
                  borderColor1 = Colors.transparent;
                  borderColor3 = Colors.transparent;
                  borderColor4 = Colors.black;
                  index = 4;
                });
              },
              icon: SvgPicture.asset('assets/svg/car.svg'),
            )),
        const SizedBox(height: 3),
        const Text('Car',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12)),
      ],
    );
  }
}
