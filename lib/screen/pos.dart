import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rassasy_tab/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class POS extends StatefulWidget {
  const POS({Key? key}) : super(key: key);

  @override
  State<POS> createState() => _POSPageState();
}

class _POSPageState extends State<POS> {

  ScrollController productController=ScrollController();
  ScrollController categoryController=ScrollController();


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
  Color buttonText1 = Colors.white;
  Color buttonText2 = Colors.black;
  Color buttonText3 = Colors.black;
  Color buttonText4 = Colors.black;

  Color pageButtonColor1 = Colors.black;
  Color pageButtonColor2 = Colors.white;
  Color pageButtonTextColor1 = Colors.black;
  Color pageButtonTextColor2 = Colors.white;
  var page = 1;
  bool buttonStyle = true;

  var index = 1;
  var order = 1;
  String dropDown = 'A/C Room';
  String status = "Vacant";
  String takeAway = "Vacant";

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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      productList.clear();
      categoryList.clear();
      diningOrderList.clear();
      getCategoryListDetail();
      carOrderLists.clear();
      takeAwayOrderLists.clear();
      onlineOrderLists.clear();
      getTableOrderList();
      getDiningDetail();
    });
  }

  var _selectedIndex = 100;
  var parsingJson = [];
  List<PassingDetail> orderDetTable = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Row(
            children: [
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 1.1,
                child: selectOrderType(index),
              ),
              Container(
                color: Colors.white,
                height:
                MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 11,
                child: orderTypeDetailScreen(),
              )
            ],
          ),
        ));
  }

  selectOrderType(int index) {
    if (index == 1) {
      paymentOption = false;
      foodDescription = false;
      return diningDetailScreen();
    } else if (index == 2) {
      paymentOption = false;
      foodDescription = false;
      return takeAwayDetailScreen();
    } else if (index == 3) {
      paymentOption = false;
      foodDescription = false;
      return onlineDeliveryDetailScreen();
    } else if (index == 4) {
      return carDeliveryDetailScreen();
      // return posDetailScreen();
    } else if (index == 6) {
      foodDescription = false;
      return paymentMethod();
    } else if (index == 7) {
      return posDetailScreen();
    }
  }

  returnDiningListItem(dineIndex) {
    if (diningOrderList.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              //  padding: EdgeInsets.all(7),
              height:
              MediaQuery.of(context).size.height / 20, //height of button
              width: MediaQuery.of(context).size.width / 20,

              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      if (dineIndex == diningOrderList.length) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.white,
                //  padding: EdgeInsets.all(7),
                height:
                MediaQuery.of(context).size.height / 20, //height of button
                width: MediaQuery.of(context).size.width / 20,

                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        index = 7;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 16,
              child: DottedBorder(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    SvgPicture.asset(
                      'assets/svg/table.svg',
                      height: 26,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(diningOrderList[dineIndex].title,
                            //'Table 1',
                            style: const TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w800)),
                        Text(diningOrderList[dineIndex].orderTime,
                            //'Table 1',
                            style: const TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w800)),
                      ],
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('To Be Paid:',
                      style: TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700)),
                  Text(diningOrderList[index].salesOrderGrandTotal.toString()),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 23,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor:
                  buttonColor(diningOrderList[dineIndex].status),
                  textStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    setState(() {
                      print(index);
                      addTable = false;
                    });
                  });
                },
                child: Text(
                  //  buttonText(index),
                    diningOrderList[dineIndex].status),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        );
      }
    }
  }

  Widget diningDetailScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:
          BoxDecoration(border: Border.all(color: const Color(0xffD6D6D6))),
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13,
          width: MediaQuery.of(context).size.width / 1,
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
                      const Text('Savadh Farooque'),
                      IconButton(
                          icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                          onPressed: () {}),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          // color: Colors.greenAccent,
          height: MediaQuery.of(context).size.height / 1.6, //height of button
          width: MediaQuery.of(context).size.width / 1,
          // color: Colors.grey,),
          child: GridView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: diningOrderList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff8D8D8D))),
                    child: returnDiningListItem(index));
              }),
        ),
        Row(
          children: [
            Container(
              child: addTable == true ? createTables() : orderedMenu(),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration:
          BoxDecoration(border: Border.all(color: const Color(0xffD6D6D6))),
          height: MediaQuery.of(context).size.height / 14, //height of button
          width: MediaQuery.of(context).size.width / 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 12, //height of button
                // width: MediaQuery.of(context).size.width / 18,

                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/addmore.svg',
                    ),
                    iconSize: 35),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height:
                MediaQuery.of(context).size.height / 14, //height of button
                // width: MediaQuery.of(context).size.width / 10,

                child: const Text('Add Table', style: TextStyle(fontSize: 13)),
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 12, //height of button
                //   width: MediaQuery.of(context).size.width / 18,
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/remove.svg',
                    ),
                    iconSize: 35),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height:
                MediaQuery.of(context).size.height / 14, //height of button
                //   width: MediaQuery.of(context).size.width / 8,
                child:
                const Text('Remove Table', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        )
      ],
    );
  }

  buttonColor(String status) {
    if (status == "Vacant") {
      return const Color(0xffE5E5E5);
    } else if (status == "Ordered") {
      return const Color(0xff03C1C1);
    } else if (status == "Billed") {
      return const Color(0xff034FC1);
    } else if (status == "Paid") {
      return const Color(0xff10C103);
    } else {
      return Colors.grey;
    }
  }

  returnTakeAwayListItem(takeIndex) {
    if (takeAwayOrderLists.isEmpty) {
      return Card(
          margin: const EdgeInsets.only(left: 4, top: 20, right: 0, bottom: 6),
          child: DottedBorder(
              color: const Color(0xff8D8D8D),
              strokeWidth: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 4.5,
                //height of button
                width: MediaQuery.of(context).size.width / 4.5,
                color: Colors.white,
                child: Center(
                  child: Container(
                    color: Colors.white,
                    //  padding: EdgeInsets.all(7),
                    height: MediaQuery.of(context).size.height /
                        20, //height of button
                    width: MediaQuery.of(context).size.width / 20,

                    child: Container(
                      decoration: const BoxDecoration(
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
              )));
    } else {
      if (takeIndex == takeAwayOrderLists.length) {
        return Card(
            margin:
            const EdgeInsets.only(left: 4, top: 20, right: 0, bottom: 6),
            child: DottedBorder(
                color: const Color(0xff8D8D8D),
                strokeWidth: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height / 4.5,
                  //height of button
                  width: MediaQuery.of(context).size.width / 4.5,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      //  padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height /
                          20, //height of button
                      width: MediaQuery.of(context).size.width / 20,

                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              index = 7;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )));
      } else {
        return Card(
          margin: const EdgeInsets.only(left: 4, top: 20, right: 0, bottom: 6),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xff8D8D8D), width: 1),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 9, //height of button
                width: MediaQuery.of(context).size.width / 4.9,

                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            19, //height of button
                        width: MediaQuery.of(context).size.width / 5.1,
                        child: DottedBorder(
                          strokeWidth: .5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon:
                                SvgPicture.asset('assets/svg/takeaway.svg'),
                              ),
                              Text(
                                  takeAwayOrderLists[takeIndex]
                                      .salesOrderGrandTotal,

                                  //'Rs.23455',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff005B37))),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 6, top: 6, right: 6, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Token',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              takeAwayOrderLists[takeIndex].tokenNo,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff4E4E4E),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          takeAwayOrderLists[takeIndex].orderTime,

                          //'23 Minutes Ago',
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xff929292)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                // padding: EdgeInsets.all(4),
                height:
                MediaQuery.of(context).size.height / 22, //height of button
                width: MediaQuery.of(context).size.width / 4.8,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor:
                    takeAwayButton(takeAwayOrderLists[takeIndex].status),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    takeAwayOrderLists[takeIndex].status,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ), // ListTile(),
            ],
          ),
        );
      }
    }
  }

  Widget takeAwayDetailScreen() {
    return Column(
      children: [
        //heading container
        Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13,
          //height of button
          width: MediaQuery.of(context).size.width / 1,
          decoration:
          BoxDecoration(border: Border.all(color: const Color(0xffD6D6D6))),
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
                      const Text('Savadh Farooque'),
                      IconButton(
                          icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                          onPressed: () {}),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.1, //height of button
          width: MediaQuery.of(context).size.width / 1.1,

          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.49,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: takeAwayOrderLists.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height /
                          6, //height of button
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: returnTakeAwayListItem(index),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  takeAwayButton(String takeAway) {
    if (takeAway == "Vacant") {
      return const Color(0xffE5E5E5);
    } else if (takeAway == "Ordered") {
      return const Color(0xff03C1C1);
    } else if (takeAway == "Billed") {
      return const Color(0xff034FC1);
    } else if (takeAway == "Paid") {
      return const Color(0xff10C103);
    } else {
      return Colors.grey;
    }
  }

  returnOnlineListItem(onlineIndex) {
    if (onlineOrderLists.isEmpty) {
      return Card(
          margin: const EdgeInsets.only(left: 4, top: 15, right: 0, bottom: 7),
          child: DottedBorder(
              color: const Color(0xff8D8D8D),
              strokeWidth: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 4.5,
                //height of button
                width: MediaQuery.of(context).size.width / 4.5,
                color: Colors.white,
                child: Center(
                  child: Container(
                    color: Colors.white,
                    //  padding: EdgeInsets.all(7),
                    height: MediaQuery.of(context).size.height /
                        20, //height of button
                    width: MediaQuery.of(context).size.width / 20,

                    child: Container(
                      decoration: const BoxDecoration(
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
              )));
    } else {
      if (onlineIndex == onlineOrderLists.length) {
        return Card(
            margin:
            const EdgeInsets.only(left: 4, top: 20, right: 0, bottom: 6),
            child: DottedBorder(
                color: const Color(0xff8D8D8D),
                strokeWidth: 1,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 4.5,
                    //height of button
                    width: MediaQuery.of(context).size.width / 4.5,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        //  padding: EdgeInsets.all(7),
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 20,

                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                index = 7;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ))));
      } else {
        return Card(
          margin: const EdgeInsets.only(left: 4, top: 20, right: 0, bottom: 6),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xff8D8D8D), width: 1),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 9, //height of button
                width: MediaQuery.of(context).size.width / 4.9,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          20, //height of button
                      width: MediaQuery.of(context).size.width / 4.9,
                      child: DottedBorder(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/svg/online.svg'),
                            ),
                            Text(
                                onlineOrderLists[onlineIndex]
                                    .salesOrderGrandTotal,
                                // 'Rs.23455',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff005B37))),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 4, top: 6, right: 4, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Token',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            onlineOrderLists[onlineIndex].tokenNo,
                            // 'Order $index',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        onlineOrderLists[onlineIndex].orderTime,

                        // '23 Minutes Ago',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff929292)),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height:
                MediaQuery.of(context).size.height / 22, //height of button
                width: MediaQuery.of(context).size.width / 4.8,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor:
                    onlineButton(onlineOrderLists[onlineIndex].status),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    onlineOrderLists[onlineIndex].status,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              )
              // ListTile(),
            ],
          ),
        );
      }
    }
  }

  Widget onlineDeliveryDetailScreen() {
    return Column(
      children: [
        //heading container
        Container(
          decoration:
          BoxDecoration(border: Border.all(color: const Color(0xffD6D6D6))),
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13,
          //height of button
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
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.1, //height of button
          width: MediaQuery.of(context).size.width / 1.1,

          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.49,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: onlineOrderLists.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height /
                          4.4, //height of button
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: returnOnlineListItem(index),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  onlineButton(String online) {
    if (online == "Vacant") {
      return const Color(0xffE5E5E5);
    } else if (online == "Ordered") {
      return const Color(0xff03C1C1);
    } else if (online == "Billed") {
      return const Color(0xff034FC1);
    } else if (online == "Paid") {
      return const Color(0xff10C103);
    } else {
      return Colors.grey;
    }
  }

  returnListItem(ind) {
    if (carOrderLists.isEmpty) {
      return Card(
          margin: const EdgeInsets.only(left: 4, top: 15, right: 0, bottom: 7),
          child: DottedBorder(
              color: const Color(0xff8D8D8D),
              strokeWidth: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 4.5,
                //height of button
                width: MediaQuery.of(context).size.width / 4.5,

                child: Center(
                  child: Container(
                    color: Colors.white,
                    //  padding: EdgeInsets.all(7),
                    height: MediaQuery.of(context).size.height /
                        20, //height of button
                    width: MediaQuery.of(context).size.width / 20,

                    child: Container(
                      decoration: const BoxDecoration(
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
              )));
    } else {
      if (ind == carOrderLists.length) {
        return Card(
            margin:
            const EdgeInsets.only(left: 4, top: 15, right: 0, bottom: 7),
            child: DottedBorder(
                color: const Color(0xff8D8D8D),
                strokeWidth: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height / 4.5,
                  //height of button
                  width: MediaQuery.of(context).size.width / 4.5,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      //  padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height /
                          20, //height of button
                      width: MediaQuery.of(context).size.width / 20,

                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              index = 7;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )));
      } else {
        return Card(
          margin: const EdgeInsets.only(left: 4, top: 15, right: 0, bottom: 7),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xff8D8D8D), width: 1),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 9.2, //height of button
                width: MediaQuery.of(context).size.width / 4.9,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          19, //height of button
                      width: MediaQuery.of(context).size.width / 4.9,
                      child: DottedBorder(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset('assets/svg/car.svg'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(carOrderLists[ind].custName,

                                        //  'savadh ',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff2B2B2B))),
                                  ],
                                ),
                              ],
                            ),
                            Text(carOrderLists[ind].salesOrderGrandTotal,

                                //'Rs.23455',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff005B37))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      //   padding: EdgeInsets.all(2),
                      //alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height /
                          35, //height of button
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Token',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            carOrderLists[ind].tokenNo,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xff4E4E4E),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: MediaQuery.of(context).size.height /
                          37, //height of button
                      width: MediaQuery.of(context).size.width / 5,
                      child: Text(
                        carOrderLists[ind].orderTime,

                        //'23 Minutes Ago',
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xff929292)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 22, //height of button
                width: MediaQuery.of(context).size.width / 4.8,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: carButton(carOrderLists[ind].status),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    carOrderLists[ind].status,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              )
              // ListTile(),
            ],
          ),
        );
      }
    }
  }

  Widget carDeliveryDetailScreen() {
    return Column(
      children: [
        //heading container
        Container(
          decoration:
          BoxDecoration(border: Border.all(color: const Color(0xffD6D6D6))),
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 13,
          //height of button
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
                      'Car',
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
                      const Text('Savadh Farooque'),
                      IconButton(
                          icon: SvgPicture.asset('assets/svg/sidemenu.svg'),
                          onPressed: () {}),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.1, //height of button
          width: MediaQuery.of(context).size.width / 1.1,

          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.49,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: carOrderLists.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height /
                          26, //height of button
                      width: MediaQuery.of(context).size.width / 4.5,
                      child: returnListItem(index),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  carButton(String car) {
    if (car == "Vacant") {
      return const Color(0xffE5E5E5);
    } else if (car == "Ordered") {
      return const Color(0xff03C1C1);
    } else if (car == "Billed") {
      return const Color(0xff034FC1);
    } else if (car == "Paid") {
      return const Color(0xff10C103);
    } else {
      return Colors.grey;
    }
  }

  ///next page (add new table method)
  Widget posDetailScreen() {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1, //height of button
          width: MediaQuery.of(context).size.width / 1.8,
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              tableNameHeader(),
              addItemDetail(),
              displayCategoryNames(),
              displayProductDetails(),
              bottomNextPageList(),
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
      return displayOrderedList();
    } else if (order == 2) {
      return chooseFlavour();
    } else if (order == 3) {
      return addFlavourDetails();
    } else {
      return displayOrderedList();
    }
  }

  Widget displayOrderedList() {
    return Container(

      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
              alignment: Alignment.bottomCenter,
              height:
              MediaQuery.of(context).size.height / 17, //height of button
              width: MediaQuery.of(context).size.width / 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Savadh Farooque'),
                  IconButton(
                      icon: SvgPicture.asset(
                        'assets/svg/sidemenu.svg',
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {}),
                ],
              )),
          const SizedBox(
            height: 17,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 22,
            width: MediaQuery.of(context).size.width / 2.6,
            color: Colors.white,
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.43,
            width: MediaQuery.of(context).size.width / 2.5,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: orderDetTable.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              order = 2;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(3),
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width / 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(

                                    orderDetTable[index].productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    orderDetTable[index].description,
                                    style: const TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: .2))),
                        ),
                        Container(
                            padding: const EdgeInsets.all(3),
                            height: MediaQuery.of(context).size.height / 9,
                            width: MediaQuery.of(context).size.width / 12,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  //' ',
                                    "Rate:${orderDetTable[index].unitPrice}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13)),
                                Text("Qty:${orderDetTable[index].quantity}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13)),
                                const Text('Extra Spicy',
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
                          padding: const EdgeInsets.all(3),
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 12,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Tax:${orderDetTable[index].taxableAmount}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                              Text("Gross:${orderDetTable[index].grossAmount}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                              Text("Net:${orderDetTable[index].netAmount}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: .2)),
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
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 27,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 6.6,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: const Color(0xffFFFFFF),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 6.6,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: const Color(0xffFFFFFF),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,

      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,

            height: MediaQuery.of(context).size.height / 30, //height of button
            width: MediaQuery.of(context).size.width / 5,
            child: const Text(
              'qty',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF25F29)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
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
                SizedBox(
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
                          icon: const Icon(Icons.minimize),
                          color: const Color(0xffFFFFFF),
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
                          icon: const Icon(Icons.add),
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 30, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: const Text(
              'Description',
              style: TextStyle(
                  color: Color(0xff717171),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height / 17, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      17, //height of button
                  width: MediaQuery.of(context).size.width / 7,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xffF25F29),
                        textStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        setState(() {
                          order = 3;
                        });
                      },
                      child: const Text('Add Flavour')),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height /
                      17, //height of button
                  width: MediaQuery.of(context).size.width / 13,
                  child: const Text(
                    'Rate:',
                    style: TextStyle(
                        color: Color(0xffF25F29),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
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
          SizedBox(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Full'),
                      trailing: const Text('Rs.400.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Half'),
                      trailing: const Text('Rs.230.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Quarter'),
                      trailing: const Text('Rs.150.00'),
                    ),
                  ),
                ),
              ])),
          Container(
            padding: const EdgeInsets.all(4),
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
          SizedBox(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Full'),
                      trailing: const Text('Rs.400.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Half'),
                      trailing: const Text('Rs.230.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Quarter'),
                      trailing: const Text('Rs.150.00'),
                    ),
                  ),
                ),
              ])),
          Container(
            padding: const EdgeInsets.all(4),
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
          SizedBox(
              height: MediaQuery.of(context).size.height / 5, //height of button
              width: MediaQuery.of(context).size.width / 2.8,
              child: ListView(children: <Widget>[
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Full'),
                      trailing: const Text('Rs.400.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Half'),
                      trailing: const Text('Rs.230.00'),
                    ),
                  ),
                ),
                SizedBox(
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
                              color: const Color(0xffFFFFFF),
                              border: Border.all(color: Colors.grey)),
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                      title: const Text('Quarter'),
                      trailing: const Text('Rs.150.00'),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      22, //,height of button
                  width: MediaQuery.of(context).size.width / 6.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: const Color(0xffFF0000),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 6.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: const Color(0xff309E10),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1, //height of button
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 22, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: const Text(
              'Flavour',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff717171)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 26, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: const Text(
              'Choose a Flavour',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
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
          const SizedBox(
            height: 4,
          ),
          SizedBox(
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 14, //height of button
            width: MediaQuery.of(context).size.width / 2.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 8,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: const Color(0xffFF0000),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      22, //height of button
                  width: MediaQuery.of(context).size.width / 8,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      backgroundColor: const Color(0xff309E10),
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

  Widget addItemDetail() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 1.7,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 15,
                child: const Text(
                  'Veg Only',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
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
        ],
      ),
    );
  }

  Widget displayCategoryNames() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6, //height of button
      width: MediaQuery.of(context).size.width / 1.7,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 9,
            //height of button
            width: MediaQuery.of(context).size.width / 25,
            decoration: const BoxDecoration(
                color: Color(0xffF25F29),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/arrowforward.svg',
              ),
            ),
          ),

          ///here
          SizedBox(
            height: MediaQuery.of(context).size.height / 8, //height of button
            width: MediaQuery.of(context).size.width / 2.17,

            child: GridView.builder(
                controller: categoryController,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 40,
                ),
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    hoverColor: Colors.transparent,
                    selected: index == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        productList.clear();
                      });
                      getProductListDetails(
                          categoryList[index].categoryGroupId);
                    },
                    title: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _selectedIndex == index
                              ? const Color(0xff172026)
                              : Colors.white,
                          side: const BorderSide(
                              color: Color(0xffB8B8B8), width: .1),
                          textStyle: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w400),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedIndex = index;
                            productList.clear();
                          });
                          getProductListDetails(
                              categoryList[index].categoryGroupId);
                        },
                        child: Text(
                          //  "Catagery $index",
                          categoryList[index].categoryName,
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? Colors.white
                                : const Color(0xff172026),
                          ),
                        )),
                  );
                }),
          ),

          Container(
            decoration: const BoxDecoration(
                color: Color(0xffF25F29),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 9,
            //height of button
            width: MediaQuery.of(context).size.width / 25,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget displayProductDetails() {
    return Container(
        padding: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 1.8, //height of button
        width: MediaQuery.of(context).size.width / 1.6,
        child: GridView.builder(
            controller: productController,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.3, //2.4 will workk
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Map data = {

                    "ProductName": productList[index].productName,
                    "UnitName": productList[index].unitName,
                    "Rate": productList[index].defaultSalesPrice,
                    "unq_id": '1',
                    "FreeQty": "0",
                    "TAX1Perc": "0",
                    "TAX1Amount": "0",
                    "TAX2Perc": "0",
                    "TAX2Amount": "0",
                    "TAX3Perc": "0",
                    "TAX3Amount": "0",
                    "KFCAmount": "0",
                    "BatchCode": "0",
                    "SerialNos": [],
                    "DefaultUnitName":"gh",
                    "GST_SalesTax": productList[index].gstSalesTax,
                    "SalesTax":"gh",
                    "GST_TaxName":"",
                    "VAT_TaxName":"",
                    "ProductID":2,
                    "DefaultUnitID":"",
                    "GST_ID":"",
                    "VatID":"",
                    "DefaultSalesPrice":"",
                    "DefaultPurchasePrice":"",
                    "is_inclusive":true,
                    "id":"",
                    "Qty":"12",
                    "UnitPrice":"100",
                    "Description":"Description",
                    "RateWithTax":"",
                    "CostPerPrice":"",
                    "GrossAmount":"1200",
                    "NetAmount":"1400",
                    "PriceListID":2,
                    "DiscountPerc":"",
                    "DiscountAmount":"",
                    "TaxableAmount":"10",
                    "VATPerc":"",
                    "VATAmount":"",
                    "SalesDetailsID":1,
                    "SGSTPerc":"",
                    "SGSTAmount":"",
                    "CGSTPerc":"",
                    "CGSTAmount":"",
                    "IGSTPerc":"",
                    "IGSTAmount":"",
                    "AddlDiscAmt":"",
                    "CreatedUserID":1,
                    "detailID":2,
                    "unitPriceRounded":"",
                    "quantityRounded":"",
                    "InclusivePrice":"",
                    "netAmountRounded":"",
                    "gstPer":"",
                    "ProductTaxName":"",
                    "ProductTaxID":1,
                    "ActualProductTaxName":"",
                    "ActualProductTaxID":2,
                    "SalesPrice":"",
                    "TotalTaxRounded":"",
                  };




                  parsingJson.add(data);

                  setState(() {
                    for (Map user in parsingJson) {
                      orderDetTable.add(PassingDetail.fromJson(user));
                    }
                  });
                },
                child: Container(
                  height:
                  MediaQuery.of(context).size.height / 8, //height of button
                  width: MediaQuery.of(context).size.width / 6,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffC9C9C9),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(
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
                              color: const Color(0xffC9C9C9),
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    5.0) //                 <--- border radius here
                            )),

                        child: SvgPicture.asset('assets/svg/Logo.svg'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            8.5, //height of button
                        width: MediaQuery.of(context).size.width / 11,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  17, //height of button
                              width: MediaQuery.of(context).size.width / 12,
                              child: Text(
                                productList[index].productName,

                                // 'plate mexican beef shawarma ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  24, //height of button
                              width: MediaQuery.of(context).size.width / 12,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. ${productList[index].defaultSalesPrice}",

                                    //'Rs.95 ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Container(
                                    height:
                                    MediaQuery.of(context).size.height / 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 1)),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          45,
                                      height:
                                      MediaQuery.of(context).size.height /
                                          20,
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
                ),
              );
            }));
  }

  Widget bottomNextPageList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9, //height of button
      width: MediaQuery.of(context).size.width / 1.7,
      //color: Colors.white,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff172026),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 11,
            //height of button
            width: MediaQuery.of(context).size.width / 25,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            height: MediaQuery.of(context).size.height / 1.5, //height of button
            width: MediaQuery.of(context).size.width / 2.19,

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), primary: pageButton1),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 12, color: buttonText1),
                    ),
                    onPressed: () {
                      setState(() {
                        pageButton1 = Colors.black;
                        pageButton2 = Colors.white;
                        pageButton3 = Colors.white;
                        pageButton4 = Colors.white;
                        buttonText1 = Colors.white;
                        buttonText2 = Colors.black;
                        buttonText3 = Colors.black;
                        buttonText4 = Colors.black;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), primary: pageButton2),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 12, color: buttonText2),
                    ),
                    onPressed: () {
                      setState(() {
                        pageButton1 = Colors.white;
                        pageButton2 = Colors.black;
                        pageButton3 = Colors.white;
                        pageButton4 = Colors.white;
                        buttonText1 = Colors.black;
                        buttonText2 = Colors.white;
                        buttonText3 = Colors.black;
                        buttonText4 = Colors.black;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), primary: pageButton3),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 12, color: buttonText3),
                    ),
                    onPressed: () {
                      setState(() {
                        pageButton1 = Colors.white;
                        pageButton2 = Colors.white;
                        pageButton3 = Colors.black;
                        pageButton4 = Colors.white;
                        buttonText1 = Colors.black;
                        buttonText2 = Colors.black;
                        buttonText3 = Colors.white;
                        buttonText4 = Colors.black;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), primary: pageButton4),
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 12, color: buttonText4),
                    ),
                    onPressed: () {
                      setState(() {
                        pageButton1 = Colors.white;
                        pageButton2 = Colors.white;
                        pageButton3 = Colors.white;
                        pageButton4 = Colors.black;
                        buttonText1 = Colors.black;
                        buttonText2 = Colors.black;
                        buttonText3 = Colors.black;
                        buttonText4 = Colors.white;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff172026),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 11,
            //height of button
            width: MediaQuery.of(context).size.width / 25,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/arrowforward.svg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableNameHeader() {
    return Container(

        padding: const EdgeInsets.all(6),
        height: MediaQuery.of(context).size.height / 15, //height of button
        width: MediaQuery.of(context).size.width / 1.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height:
              MediaQuery.of(context).size.height / 16, //height of button
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
            GestureDetector(
              onTap: (){
                setState(() {
                  showAlert();
                });
              },
              child:  SizedBox(
                height:
                MediaQuery.of(context).size.height / 18, //height of button
                width: MediaQuery.of(context).size.width / 6,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xffFFFFFF),
                    backgroundColor: const Color(0xff172026), // Background Color
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
              ),
            )

          ],
        ));
  }

  Widget orderTypeDetailScreen() {
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
                color2 = const Color(0xffF8F8F8);
                color3 = const Color(0xffF8F8F8);
                color4 = const Color(0xffF8F8F8);
                borderColor1 = Colors.black;
                borderColor2 = Colors.transparent;
                borderColor3 = Colors.transparent;
                borderColor4 = Colors.transparent;
                index = 1;
              });
            },
            icon: SvgPicture.asset(
              'assets/svg/dining.svg',
            ),
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
                  color1 = const Color(0xffF8F8F8);
                  color2 = Colors.white;
                  color3 = const Color(0xffF8F8F8);
                  color4 = const Color(0xffF8F8F8);
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
                  color1 = const Color(0xffF8F8F8);
                  color2 = const Color(0xffF8F8F8);
                  color3 = Colors.white;
                  color4 = const Color(0xffF8F8F8);
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
                  color1 = const Color(0xffF8F8F8);
                  color2 = const Color(0xffF8F8F8);
                  color4 = Colors.white;
                  color3 = const Color(0xffF8F8F8);
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

  Widget paymentMethod() {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.1,
          //height of button
          width: MediaQuery.of(context).size.width / 1.7,
          decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: .2)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          13, //height of button
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Text('To Be Paid',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                    SizedBox(
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
                    color: const Color(0xffFFFFFF),
                    border: Border.all(color: Colors.grey, width: .2)),
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / 1.5, //height of button
                width: MediaQuery.of(context).size.width / 1.4,
                //  color: Colors.grey,
                child: Row(
                  children: [
                    SizedBox(
                      //cashh
                      height: MediaQuery.of(context).size.height /
                          1.5, //height of button
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.6,
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('5')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('10')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('100')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('200')),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            //color: Colors.yellow,
                            width: MediaQuery.of(context).size.width / 3.6,
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('20')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('50')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('500')),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  width: MediaQuery.of(context).size.width / 15,
                                  height:
                                  MediaQuery.of(context).size.height / 18,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor:
                                        const Color(0xff262626),
                                        textStyle: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      child: const Text('1000')),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              //   color: Colors.red,
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width /
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
                                      width: MediaQuery.of(context).size.width /
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
                                      MediaQuery.of(context).size.width / 9,
                                      height:
                                      MediaQuery.of(context).size.height /
                                          18,
                                      child: TextButton(
                                          style: TextButton.styleFrom(
                                            //    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(22))),

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
                          SizedBox(
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              //  color:Colors.grey,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 14,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
                                    //color: Colors.grey,
                                    child: const Text(
                                      'Amount:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 5.5,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 14,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
                                    // color: Colors.grey,
                                    child: const Text(
                                      'Card Type:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 5.5,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 14,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
                                    //color: Colors.grey,
                                    child: const Text(
                                      'Card No:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 5.5,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.6,
                              height: MediaQuery.of(context).size.height / 18,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                    MediaQuery.of(context).size.width / 14,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
                                    child: const Text(
                                      'Discount:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                    MediaQuery.of(context).size.width / 18,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                                    width:
                                    MediaQuery.of(context).size.width / 16,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                                    width:
                                    MediaQuery.of(context).size.width / 15,
                                    height:
                                    MediaQuery.of(context).size.height / 18,
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
                height:
                MediaQuery.of(context).size.height / 12, //height of button
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
            height: MediaQuery.of(context).size.height / 1.1, //height of button
            width: MediaQuery.of(context).size.width / 3.3,

            // color: Colors.purple[100],
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      1.35, //height of button
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(1),
                          height: MediaQuery.of(context).size.height /
                              10, //height of button
                          width: MediaQuery.of(context).size.width / 2.5,
                          //
                          child: Row(children: [
                            Container(
                                padding: const EdgeInsets.all(3),
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
                                padding: const EdgeInsets.all(3),
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
                                  border:
                                  Border.all(color: Colors.grey, width: .2),
                                )),
                            Container(
                              padding: const EdgeInsets.all(3),
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
                                icon: SvgPicture.asset('assets/svg/clear.svg'),
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
    );
  }

  Widget createTables() {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3,
        color: const Color(0xffEBEBEB),
        padding: const EdgeInsets.all(7),
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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
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
                      hintStyle: TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      hintStyle: TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  height: MediaQuery.of(context).size.height /
                      16, //height of button
                  width: MediaQuery.of(context).size.width / 15,
                  child: TextField(
                    focusNode: no,
                    decoration: const InputDecoration(
                      hintText: 'No',
                      hintStyle: TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
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
              ],
            ),
            Row(children: [
              const Text('Price Category', style: TextStyle(fontSize: 13)),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height / 19,
                width: MediaQuery.of(context).size.width / 6,
                child: DropdownButton(
                  value: dropDown,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: const SizedBox(),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(fontSize: 13),
                      ),
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

  Widget orderedMenu() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
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
          SizedBox(
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
          SizedBox(
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
                    height: 5,
                  ),
                  const Text('Phone'),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Location'),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20, //height of button
                        width: MediaQuery.of(context).size.width / 8,
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
                        width: MediaQuery.of(context).size.width / 8,
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

  Future<Null> getCategoryListDetail() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? 0;
        //var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos/product-group/list/';
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
            stop();

            for (Map user in responseJson) {
              categoryList.add(CategoryListModel.fromJson(user));
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

  Future<Null> getProductListDetails(groupId) async {
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

        var companyID = prefs.getString('companyID') ?? '';

        var branchID = BaseUrl.branchID;

        var priceRounding = BaseUrl.priceRounding;
        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-product-list/';

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "GroupID": groupId,
          "PriceRounding": priceRounding
        };

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

        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              productList.add(ProductListModelDetail.fromJson(user));
            }
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {
          stop();
        }
      } catch (e) {
        setState(() {
          stop();
        });
      }
    }
  }

  Future<Null> getTableOrderList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        String baseUrl = BaseUrl.bUrl;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? 0;
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-table-list/';
        print(url);
        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "type": "user",
          "paid": true
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
        var onlineStatus = n["OnlineStatusCode"];
        var takeawayStatus = n["TakeAwayStatusCode"];
        var carStatus = n["CarStatusCode"];
        print(onlineStatus);
        print(takeawayStatus);
        print(carStatus);

        var Online = n["Online"];
        var TakeAway = n["TakeAway"];
        var Car = n["Car"];

        print(Online);
        print(TakeAway);
        print(Car);

        if (onlineStatus == 6000) {
          setState(() {
            stop();

            for (Map user in Online) {
              onlineOrderLists.add(PosListModel.fromJson(user));
            }
          });
        }

        if (takeawayStatus == 6000) {
          setState(() {
            stop();

            for (Map user in TakeAway) {
              takeAwayOrderLists.add(PosListModel.fromJson(user));
            }
          });
        }

        if (carStatus == 6000) {
          setState(() {
            stop();

            for (Map user in Car) {
              carOrderLists.add(PosListModel.fromJson(user));
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

  Future<Null> getDiningDetail() async {
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

        var companyID = prefs.getString('companyID') ?? '';

        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-table-list/';
        print(url);
        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "type": "user",
          "paid": true
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
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              diningOrderList.add(DiningListModel.fromJson(user));
            }
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {
          stop();
        }
      } catch (e) {
        setState(() {
          stop();
        });
      }
    }
  }

  Future<Null> getCancelOrder() async {
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

        var companyID = prefs.getString('companyID') ?? '';

        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-table-list/';
        print(url);
        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "type": "user",
          "paid": true
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
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              cancelReportList.add(CancelReportModel.fromJson(user));
            }
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          snackBarMessage(context, msg);
        } else {
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

List<CategoryListModel> categoryList = [];

class CategoryListModel {
  final String categoryId, categoryName;
  final int categoryGroupId;

  CategoryListModel(
      {required this.categoryName,
        required this.categoryGroupId,
        required this.categoryId});

  factory CategoryListModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoryListModel(
        categoryName: json['GroupName'],
        categoryGroupId: json['ProductGroupID'],
        categoryId: json['id']);
  }
}

List<ProductListModelDetail> productList = [];

class ProductListModelDetail {
  final String id,
      productName,
      unitName,
      gstSalesTax,
      salesTax,
      gstTaxName,
      vatTaxName;
  final int productId, unitId, gstId, vatId;

  final String defaultSalesPrice, defaultPurchasePrice;
  final bool isInclusive;

  ProductListModelDetail(
      {required this.id,
        required this.productName,
        required this.unitName,
        required this.gstSalesTax,
        required this.salesTax,
        required this.gstTaxName,
        required this.vatTaxName,
        required this.productId,
        required this.unitId,
        required this.gstId,
        required this.vatId,
        required this.defaultSalesPrice,
        required this.defaultPurchasePrice,
        required this.isInclusive});

  factory ProductListModelDetail.fromJson(Map<dynamic, dynamic> json) {
    return ProductListModelDetail(
        id: json['id'],
        productName: json['ProductName'],
        unitName: json['DefaultUnitName'],
        gstSalesTax: json['GST_SalesTax'],
        salesTax: json['SalesTax'],
        gstTaxName: json['GST_TaxName'],
        vatTaxName: json['VAT_TaxName'],
        productId: json['ProductID'],
        unitId: json['DefaultUnitID'],
        gstId: json['GST_ID'],
        vatId: json['VatID'],
        defaultSalesPrice: json['DefaultSalesPrice'].toString(),
        defaultPurchasePrice: json['DefaultPurchasePrice'].toString(),
        isInclusive: json['is_inclusive']);
  }
}







class PassingDetail {
  final  int productId,
      priceListId,
      createUserId,
      salesDetailsID,
      detailID,
      actualProductTaxID,
      productTaxID;
  final String productName,
      quantity,
      unitPrice,
      netAmount,
      uniqueId,
      discountAmount,
      grossAmount,
      rateWithTax,
      costPerPrice,
      discountPercentage,
      taxableAmount,
      vatPer,
      vatAmount,
      sgsPer,
      sgsAmount,
      cgsPer,
      cgsAmount,
      roundedUnitPrice,
      netAmountRounded,
      igsPer,
      igsAmount,
      roundedQuantity,
      inclusivePrice,
      unitPriceName,
      additionalDiscount,
      gstPer,
      actualProductTaxName,
      salesPrice,
      totalTaxRounded,
      description,
      productTaxName;
  final bool productInc;



  PassingDetail({
    required this.uniqueId,
    required this.productName,
    required this.grossAmount,
    required this.unitPrice,
    required this.netAmount,
    required this.salesDetailsID,
    required  this.quantity,
    required this.discountAmount,
    required this.productId,
    required this.rateWithTax,
    required this.costPerPrice,
    required this.priceListId,
    required this.additionalDiscount,
    required this.discountPercentage,
    required this.taxableAmount,
    required  this.vatPer,
    required this.vatAmount,
    required this.sgsPer,
    required this.cgsAmount,
    required this.cgsPer,
    required this.createUserId,
    required this.igsAmount,
    required  this.igsPer,
    required this.sgsAmount,
    required this.netAmountRounded,
    required this.detailID,
    required this.inclusivePrice,
    required this.roundedUnitPrice,
    required  this.roundedQuantity,
    required  this.gstPer,
    required this.unitPriceName,
    required this.productTaxID,
    required this.productTaxName,
    required this.actualProductTaxName,
    required this.actualProductTaxID,
    required this.salesPrice,
    required this.productInc,
    required this.totalTaxRounded,
    required  this.description,
  });

  factory PassingDetail.fromJson(Map<dynamic, dynamic> json) {
    return PassingDetail(

      uniqueId: json['id'],
      productId: json['ProductID'],
      productName: json['ProductName'],
      quantity: json['Qty'].toString(),
      unitPrice: json['UnitPrice'].toString(),
      description: json['Description'],
      rateWithTax: json['RateWithTax'].toString(),
      costPerPrice: json['CostPerPrice'].toString(),
      grossAmount: json['GrossAmount'].toString(),
      netAmount: json['NetAmount'].toString(),
      priceListId: json['PriceListID'],
      discountPercentage: json['DiscountPerc'].toString(),
      discountAmount: json['DiscountAmount'].toString(),
      taxableAmount: json['TaxableAmount'].toString(),
      vatPer: json['VATPerc'].toString(),
      vatAmount: json['VATAmount'].toString(),
      salesDetailsID: json['SalesDetailsID'],
      sgsPer: json['SGSTPerc'].toString(),
      sgsAmount: json['SGSTAmount'].toString(),
      cgsPer: json['CGSTPerc'].toString(),
      cgsAmount: json['CGSTAmount'].toString(),
      igsPer: json['IGSTPerc'].toString(),
      igsAmount: json['IGSTAmount'].toString(),
      additionalDiscount: json['AddlDiscAmt'].toString(),
      createUserId: json['CreatedUserID'],
      detailID: json['detailID'],
      productInc: json['is_inclusive'],
      roundedUnitPrice: json['unitPriceRounded'].toString(),
      roundedQuantity: json['quantityRounded'].toString(),
      inclusivePrice: json['InclusivePrice'].toString(),
      netAmountRounded: json['netAmountRounded'].toString(),
      unitPriceName: json['UnitName'],
      gstPer: json['gstPer'].toString(),
      productTaxName: json['ProductTaxName'],
      productTaxID: json['ProductTaxID'],
      actualProductTaxName: json['ActualProductTaxName'],
      actualProductTaxID: json['ActualProductTaxID'],
      salesPrice: json['SalesPrice'].toString(),
      totalTaxRounded: json['TotalTaxRounded'].toString(),
    );
  }
}



List<PosListModel> onlineOrderLists = [];
List<PosListModel> takeAwayOrderLists = [];
List<PosListModel> carOrderLists = [];

class PosListModel {
  final String salesOrderId,
      salesId,
      custName,
      tokenNo,
      phone,
      status,
      salesOrderGrandTotal,
      salesGrandTotal,
      orderTime;

  PosListModel(
      {required this.salesOrderId,
        required this.salesId,
        required this.custName,
        required this.tokenNo,
        required this.phone,
        required this.status,
        required this.salesOrderGrandTotal,
        required this.salesGrandTotal,
        required this.orderTime});

  factory PosListModel.fromJson(Map<dynamic, dynamic> json) {
    return PosListModel(
        salesOrderId: json['SalesOrderID'],
        salesId: json['SalesID'],
        custName: json['CustomerName'],
        tokenNo: json['TokenNumber'],
        phone: json['Phone'],
        status: json['Status'],
        salesOrderGrandTotal: json['SalesOrderGrandTotal'],
        salesGrandTotal: json['SalesGrandTotal'],
        orderTime: json['OrderTime']);
  }
}







List<DiningListModel> diningOrderList = [];

class DiningListModel {
  ///model
  final String id,  title, description,  priceCategory, status, priceId, salesOrderID, salesMasterID,orderTime;




  final bool isActive;
  final int salesOrderGrandTotal, salesGrandTotal    ;

  DiningListModel(
      {required this.id,
        required this.title,
        required this.description,
        required this.priceCategory,
        required this.status,
        required this.priceId,
        required this.salesOrderID,
        required this.salesMasterID,
        required this.orderTime,
        required this.salesOrderGrandTotal,
        required this.salesGrandTotal,
        required this.isActive,


      });

  factory DiningListModel.fromJson(Map<dynamic, dynamic> json) {
    return DiningListModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      priceCategory: json['PriceCategory'],
      status: json['Status'],
      priceId: json['priceid'],
      salesOrderID: json['SalesOrderID'],
      salesMasterID: json['SalesMasterID'],
      salesOrderGrandTotal: json['SalesOrderGrandTotal'],
      salesGrandTotal: json['SalesGrandTotal'],
      orderTime: json['OrderTime'],
      isActive: json['IsActive'],

    );




  }
}

List<CancelReportModel> cancelReportList = [];

class CancelReportModel {
  final String id, reason;
  final int branchID;

  CancelReportModel(
      {required this.id, required this.reason, required this.branchID});

  factory CancelReportModel.fromJson(Map<dynamic, dynamic> json) {
    return CancelReportModel(
        id: json['id'], branchID: json['BranchID'], reason: json['Reason']);
  }
}
