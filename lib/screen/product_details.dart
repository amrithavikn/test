import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool dishList = false;
  bool sideList = false;
  bool beavaregeList = false;
  bool starterList = false;
  bool dessertList = false;
  int index = 1;
  Color color1 = Colors.orange;
  Color color2 = Colors.transparent;
  Color template1 = Colors.white;
  Color template2 = const Color(0xffF8F8F8);
  Color template3 = const Color(0xffF8F8F8);
  Color template4 = const Color(0xffF8F8F8);

  String? addStarters;
  List<String> variants = [
    'Full',
    'Quarter',
    'Medium',
  ];

  void checkDishList() {}

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
                  'Products',
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
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 23,
                      width: MediaQuery.of(context).size.width / 1,
                      child: const Text(
                        'Add Product',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 1.81,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1,
                              width: MediaQuery.of(context).size.width / 3.9,
                              //  color: Colors.blue,
                              child: Column(
                                children: [
                                  addProductImages()   ,
                                  chooseVegOrNon()  ,
                                  addProductNameDetail()  ,
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      //       color: Colors.pink,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text('Price',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    )),
                                                const SizedBox(height: 4),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      22,
                                                  child: const TextField(
                                                    // maxLines: 1,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.all(14),
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text('Tax',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    )),
                                                const SizedBox(height: 4),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      22,
                                                  child: const TextField(
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.all(14),
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                        //here the container
                                      ))
                                ],
                              ),
                            ),
                            //list vieww of starter dishes
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1,
                              width: MediaQuery.of(context).size.width / 2.6,
                              child: Row(children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 1,
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    //   color: Colors.blue,
                                    child: Column(children: [
                                      Card(
                                        child: ListTile(
                                          title: const Text('Add Starter'),
                                          trailing: IconButton(
                                              onPressed: () {
                                                //    foodList("starterList");

                                                setState(() {
                                                  starterList = true;
                                                  dishList = false;
                                                  sideList = false;
                                                  beavaregeList = false;
                                                  dessertList = false;
                                                });

                                                //   print(dishList);
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/svg/addproduct.svg')),
                                        ),
                                      ),

                                      starterList == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        starterList = false;
                                                      });
                                                    },
                                                    title: const Text(
                                                      'starter',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Container(),

                                      Card(
                                        child: ListTile(
                                          title: const Text('Add Dishes'),
                                          trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  dishList = true;
                                                  starterList = false;

                                                  sideList = false;
                                                  beavaregeList = false;
                                                  dessertList = false;
                                                });

                                                //   print(dishList);
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/svg/addproduct.svg')),
                                        ),
                                      ),

                                      dishList == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        dishList = false;
                                                      });
                                                    },
                                                    title: const Text(
                                                      'dishes',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Container(),

                                      Card(
                                        child: ListTile(
                                          title: const Text('Add Sides'),
                                          trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  sideList = true;
                                                  starterList = false;
                                                  dishList = false;
                                                  beavaregeList = false;
                                                  dessertList = false;
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/svg/addproduct.svg')),
                                        ),
                                      ),
                                      sideList == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        sideList = false;
                                                      });
                                                    },
                                                    title: const Text(
                                                      'side dishh',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Container(),

                                      Card(
                                        child: ListTile(
                                          title: const Text('Add Beaverages'),
                                          trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  beavaregeList = true;
                                                  starterList = false;
                                                  dishList = false;
                                                  sideList = false;

                                                  dessertList = false;
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/svg/addproduct.svg')),
                                        ),
                                      ),
                                      beavaregeList == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        beavaregeList = false;
                                                      });
                                                    },
                                                    title: const Text(
                                                      'beavarege',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Container(),

                                      Card(
                                        child: ListTile(
                                          title: const Text('Add Desserts'),
                                          trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  dessertList = true;
                                                  starterList = false;
                                                  dishList = false;
                                                  sideList = false;
                                                  beavaregeList = false;
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                  'assets/svg/addproduct.svg')),
                                        ),
                                      ),
                                      dessertList == true
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        dessertList = false;
                                                      });
                                                    },
                                                    title: const Text(
                                                      'dessert',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                );
                                              })
                                          : Container(),
//here

                                      // color: Colors.green,
                                    ])),
                              ]),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 19,
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
                  ]),
                ),
              ),
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
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xffFFFFFF),
                              height: MediaQuery.of(context).size.height / 17,
                              //height of button
                              width: MediaQuery.of(context).size.width / 2.6,
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  contentPadding: EdgeInsets.all(5),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            displayProductNameList()   ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  13, //height of button
                              width: MediaQuery.of(context).size.width / 2.6,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        tooltip: '',
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/svg/addmore.svg',
                                        ),
                                        iconSize: 40),
                                  ]),
                            ),
                          ],
                        ),
                      )))
            ])));
  }
  Widget addProductImages(){
    return Container(
      padding: const EdgeInsets.all(8.0),
      height:
      MediaQuery.of(context).size.height / 7,
      width:
      MediaQuery.of(context).size.width / 4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                  selectImage(index);
                  //  templateViewColor(templateIndex);
                });
              },
              child: Container(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    8,
                width: MediaQuery.of(context)
                    .size
                    .width /
                    12,
                color: template1,
                child: SvgPicture.asset(
                    'assets/svg/Logo.svg'),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                  selectImage(index);
                  //  templateViewColor(templateIndex);
                });
              },
              child: Container(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    8,
                width: MediaQuery.of(context)
                    .size
                    .width /
                    12,
                color: template2,
                child: SvgPicture.asset(
                    'assets/svg/Logo.svg'),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 3;
                  selectImage(index);
                  //  templateViewColor(templateIndex);
                });
              },
              child: Container(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    8,
                width: MediaQuery.of(context)
                    .size
                    .width /
                    12,
                color: template3,
                child: SvgPicture.asset(
                    'assets/svg/Logo.svg'),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 3;
                  selectImage(index);
                  //  templateViewColor(templateIndex);
                });
              },
              child: Container(
                height: MediaQuery.of(context)
                    .size
                    .height /
                    8,
                width: MediaQuery.of(context)
                    .size
                    .width /
                    12,
                color: template4,
                child: SvgPicture.asset(
                    'assets/svg/Logo.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget chooseVegOrNon(){
    return SizedBox(
      height:
      MediaQuery.of(context).size.height / 10,
      width:
      MediaQuery.of(context).size.width / 4,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: MediaQuery.of(context)
                  .size
                  .height /
                  14,
              width: MediaQuery.of(context)
                  .size
                  .width /
                  9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: color1,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // setState(() {   color1 = Colors.orange;   color2 = Colors.transparent; });
                      },
                      icon: SvgPicture.asset(
                          'assets/svg/veg.svg')),
                  const Text('Veg')
                ],
              ),
            ),
            onTap: () {
              setState(() {
                color1 = Colors.orange;
                color2 = Colors.transparent;
              });
            },
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
              child: Container(
                // padding:EdgeInsets.only(right: 2.0),
                  height: MediaQuery.of(context)
                      .size
                      .height /
                      14,
                  width: MediaQuery.of(context)
                      .size
                      .width /
                      9,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            color2 =
                                Colors.orange;
                            color1 = Colors
                                .transparent;
                          });
                        },
                        icon: SvgPicture.asset(
                            'assets/svg/nonveg.svg')),
                    const Text('Non Veg')
                  ])),
              onTap: () {
                //  print('gg');
                setState(() {
                  color2 = Colors.orange;
                  color1 = Colors.transparent;
                });
              }),
        ],
      ),
      //color: Colors.red,
    );
  }
  Widget addProductNameDetail(){
    return  ListView(
        shrinkWrap: true, children: [
      const Text(
        'Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 4),
      SizedBox(
        height:
        MediaQuery.of(context).size.height /
            22,
        child: const TextField(
          textCapitalization:
          TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      const Text('Catagery',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      const SizedBox(height: 6),
      SizedBox(
        height:
        MediaQuery.of(context).size.height /
            22,
        child: const TextField(
          textCapitalization:
          TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      const Text('Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      const SizedBox(height: 6),
      const TextField(
        textCapitalization:
        TextCapitalization.words,
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
Widget displayProductNameList(){
    return  SizedBox(
      height: MediaQuery.of(context).size.height /
          1.36, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: productLists.length,
          itemBuilder:
              (BuildContext context, int index) {
            return SizedBox(
              height:
              MediaQuery.of(context).size.height /
                  10, //height of button
              width: MediaQuery.of(context).size.width /
                  2.5,
              child: Card(
                margin: const EdgeInsets.all(4),
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
                  title: Text(
                      productLists[index].productName),
                  subtitle: const Text('<Catagery>'),
                  trailing: Text(productLists[index]
                      .defaultSalesPrice),
                  isThreeLine: true,
                ),
              ),
            );
          }),
    );
}
  foodList(val) {
    setState(() {
      if (val == "starterList") {
        starterList = true;
        dishList = false;
        sideList = false;
        beavaregeList = false;
        dessertList = false;
      }
    });
  }

  selectImage(int index) {
    if (index == 1) {
      template1 = Colors.white;
      template2 = const Color(0xffF8F8F8);
      template3 = const Color(0xffF8F8F8);
      template4 = const Color(0xffF8F8F8);
    } else if (index == 2) {
      template1 = const Color(0xffF8F8F8);
      template2 = Colors.white;
      template3 = const Color(0xffF8F8F8);
      template4 = const Color(0xffF8F8F8);
    } else if (index == 3) {
      template1 = const Color(0xffF8F8F8);
      template2 = const Color(0xffF8F8F8);
      template3 = Colors.white;
      template4 = const Color(0xffF8F8F8);
    } else if (index == 4) {
      template1 = const Color(0xffF8F8F8);
      template2 = const Color(0xffF8F8F8);
      template3 = const Color(0xffCFCFCF);
      template4 = Colors.white;
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {

      getAddProductListDetails();
    });
  }

  Future<Null> getAddProductListDetails() async {
  //  start(context);
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

        var groupID = 1;

        var priceRounding = BaseUrl.priceRounding;
        var accessToken = prefs.getString('access') ?? '';
        final String url = '$baseUrl/posholds/pos-product-list/';


        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "GroupID": groupID,
          "PriceRounding": priceRounding
        };


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

///
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              productLists.add(AddProductListModel.fromJson(user));
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

List<AddProductListModel> productLists = [];

class AddProductListModel {
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

  AddProductListModel(
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

  factory AddProductListModel.fromJson(Map<dynamic, dynamic> json) {
    return AddProductListModel(
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
