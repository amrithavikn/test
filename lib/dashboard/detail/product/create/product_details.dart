import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rassasy_tab/global/global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import 'detail/selec_category.dart';
import 'detail/selec_taxtype.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool dishList = false;
  bool variant = false;
  bool sideList = false;
  bool beavaregeList = false;
  bool starterList = false;
  bool dessertList = false;
  bool edit=false;
  int index = 1;
  Color color1 = Colors.orange;
  Color color2 = Colors.transparent;
  Color template1 = Colors.white;
  Color template2 = const Color(0xffF8F8F8);
  Color template3 = const Color(0xffF8F8F8);
  Color template4 = const Color(0xffF8F8F8);

  String var_id = "";
  String tax_id = "";
  TextEditingController variantNameController = TextEditingController();
  TextEditingController variantPriceController = TextEditingController();
  TextEditingController variantTaxController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController taxTypeController = TextEditingController();
  ScrollController productListController=ScrollController();

  FocusNode variantNameNode = FocusNode();
  FocusNode variantPriceNode = FocusNode();
  FocusNode variantTaxNode = FocusNode();
  FocusNode productNameNode = FocusNode();
  FocusNode categoryNode = FocusNode();
  FocusNode descriptionNode = FocusNode();
  FocusNode productPriceNode = FocusNode();
  FocusNode purchasePriceNode = FocusNode();
  FocusNode taxTypeNode = FocusNode();

  ScrollController variantScrollController = ScrollController();

  String? addStarters;
  List<String> variants = [
    'Full',
    'Quarter',
    'Medium',
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getVariantListApi();
      getProductList();
    });
  }

  String category = "Starter";
  String taxType = "Tax 1";
  String varName = "Add Variant";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
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
                      icon: SvgPicture.asset(
                        'assets/svg/sidemenu.svg',
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                ]),
            body: Row(children: <Widget>[
              Container(
                height:
                    MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    ///heading
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 23,
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

                    ///product image ,variants, details
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.31,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///image, name details
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 1,
                              width: MediaQuery.of(context).size.width / 3.9,
                              //  color: Colors.blue,
                              child: Column(
                                children: [
                                  addProductImages(),
                                  const SizedBox(height: 6),
                                  chooseVegOrNon(),
                                  const SizedBox(height: 12),
                                  addProductNameDetail(),
                                ],
                              ),
                            ),

                            ///list view of starter dishes
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
                                    child: ListView(
                                        controller: variantScrollController,
                                        shrinkWrap: true,
                                        children: [
                                          Card(
                                            child: ListTile(
                                              onTap: () {
                                                setState(() {
                                                  variant = true;

                                                  starterList = false;
                                                  dishList = false;
                                                  sideList = false;
                                                  beavaregeList = false;
                                                  dessertList = false;
                                                });
                                              },
                                              title: Row(
                                                children: [
                                                  Text(varName),
                                                  const Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 10,
                                                  )
                                                ],
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      showAlert();
                                                    });
                                                  },
                                                  icon: SvgPicture.asset(
                                                      'assets/svg/addproduct.svg')),
                                            ),
                                          ),

                                          variant == true
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: variantList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Card(
                                                      child: ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            var_id =
                                                                variantList[
                                                                        index]
                                                                    .uId;
                                                            varName =
                                                                variantList[
                                                                        index]
                                                                    .variantName;

                                                            variant = false;
                                                          });
                                                        },
                                                        title: Text(
                                                          variantList[index]
                                                              .variantName,
                                                          //  'variant',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                      ),
                                                    );
                                                  })
                                              : Container(),

                                          ///lists
                                          // Card(
                                          //   child: ListTile(
                                          //     title: const Text('Add Starter'),
                                          //     trailing: IconButton(
                                          //         onPressed: () {
                                          //           //    foodList("starterList");
                                          //
                                          //           setState(() {
                                          //             variant=false;
                                          //
                                          //             starterList = true;
                                          //             dishList = false;
                                          //             sideList = false;
                                          //             beavaregeList = false;
                                          //             dessertList = false;
                                          //           });
                                          //
                                          //           //   print(dishList);
                                          //         },
                                          //         icon: SvgPicture.asset(
                                          //             'assets/svg/addproduct.svg')),
                                          //   ),
                                          // ),
                                          //
                                          // starterList == true
                                          //     ? ListView.builder(
                                          //         shrinkWrap: true,
                                          //         itemCount: 4,
                                          //         itemBuilder:
                                          //             (BuildContext context,
                                          //                 int index) {
                                          //           return Card(
                                          //             child: ListTile(
                                          //               onTap: () {
                                          //                 setState(() {
                                          //                   starterList = false;
                                          //                 });
                                          //               },
                                          //               title: const Text(
                                          //                 'starter',
                                          //                 style: TextStyle(
                                          //                     color: Colors.red),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         })
                                          //     : Container(),
                                          //
                                          // Card(
                                          //   child: ListTile(
                                          //     title: const Text('Add Dishes'),
                                          //     trailing: IconButton(
                                          //         onPressed: () {
                                          //           setState(() {
                                          //             dishList = true;
                                          //             starterList = false;
                                          //             variant=false;
                                          //
                                          //             sideList = false;
                                          //             beavaregeList = false;
                                          //             dessertList = false;
                                          //           });
                                          //
                                          //           //   print(dishList);
                                          //         },
                                          //         icon: SvgPicture.asset(
                                          //             'assets/svg/addproduct.svg')),
                                          //   ),
                                          // ),
                                          //
                                          // dishList == true
                                          //     ? ListView.builder(
                                          //         shrinkWrap: true,
                                          //         itemCount: 4,
                                          //         itemBuilder:
                                          //             (BuildContext context,
                                          //                 int index) {
                                          //           return Card(
                                          //             child: ListTile(
                                          //               onTap: () {
                                          //                 setState(() {
                                          //                   dishList = false;
                                          //                 });
                                          //               },
                                          //               title: const Text(
                                          //                 'dishes',
                                          //                 style: TextStyle(
                                          //                     color: Colors.red),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         })
                                          //     : Container(),
                                          //
                                          // Card(
                                          //   child: ListTile(
                                          //     title: const Text('Add Sides'),
                                          //     trailing: IconButton(
                                          //         onPressed: () {
                                          //           setState(() {
                                          //             variant=false;
                                          //
                                          //             sideList = true;
                                          //             starterList = false;
                                          //             dishList = false;
                                          //             beavaregeList = false;
                                          //             dessertList = false;
                                          //           });
                                          //         },
                                          //         icon: SvgPicture.asset(
                                          //             'assets/svg/addproduct.svg')),
                                          //   ),
                                          // ),
                                          // sideList == true
                                          //     ? ListView.builder(
                                          //         shrinkWrap: true,
                                          //         itemCount: 4,
                                          //         itemBuilder:
                                          //             (BuildContext context,
                                          //                 int index) {
                                          //           return Card(
                                          //             child: ListTile(
                                          //               onTap: () {
                                          //                 setState(() {
                                          //                   sideList = false;
                                          //                 });
                                          //               },
                                          //               title: const Text(
                                          //                 'side dishh',
                                          //                 style: TextStyle(
                                          //                     color: Colors.red),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         })
                                          //     : Container(),
                                          //
                                          // Card(
                                          //   child: ListTile(
                                          //     title: const Text('Add Beaverages'),
                                          //     trailing: IconButton(
                                          //         onPressed: () {
                                          //           setState(() {
                                          //             variant=false;
                                          //
                                          //             beavaregeList = true;
                                          //             starterList = false;
                                          //             dishList = false;
                                          //             sideList = false;
                                          //
                                          //             dessertList = false;
                                          //           });
                                          //         },
                                          //         icon: SvgPicture.asset(
                                          //             'assets/svg/addproduct.svg')),
                                          //   ),
                                          // ),
                                          // beavaregeList == true
                                          //     ? ListView.builder(
                                          //         shrinkWrap: true,
                                          //         itemCount: 4,
                                          //         itemBuilder:
                                          //             (BuildContext context,
                                          //                 int index) {
                                          //           return Card(
                                          //             child: ListTile(
                                          //               onTap: () {
                                          //                 setState(() {
                                          //                   beavaregeList = false;
                                          //                 });
                                          //               },
                                          //               title: const Text(
                                          //                 'beavarege',
                                          //                 style: TextStyle(
                                          //                     color: Colors.red),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         })
                                          //     : Container(),
                                          //
                                          // Card(
                                          //   child: ListTile(
                                          //     title: const Text('Add Desserts'),
                                          //     trailing: IconButton(
                                          //         onPressed: () {
                                          //           setState(() {
                                          //             variant=false;
                                          //
                                          //             dessertList = true;
                                          //             starterList = false;
                                          //             dishList = false;
                                          //             sideList = false;
                                          //             beavaregeList = false;
                                          //           });
                                          //         },
                                          //         icon: SvgPicture.asset(
                                          //             'assets/svg/addproduct.svg')),
                                          //   ),
                                          // ),
                                          // dessertList == true
                                          //     ? ListView.builder(
                                          //         shrinkWrap: true,
                                          //         itemCount: 4,
                                          //         itemBuilder:
                                          //             (BuildContext context,
                                          //                 int index) {
                                          //           return Card(
                                          //             child: ListTile(
                                          //               onTap: () {
                                          //                 setState(() {
                                          //                   dessertList = false;
                                          //                 });
                                          //               },
                                          //               title: const Text(
                                          //                 'dessert',
                                          //                 style: TextStyle(
                                          //                     color: Colors.red),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         })
                                          //     : Container(),
//here

                                          // color: Colors.green,
                                        ])),
                              ]),
                            )
                          ]),
                    ),

                    ///add delete buttons
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 19,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // if(productNameController.text== ''&& categoryController.text =='' &&
                                    //     salesPriceController.text =='' && purchasePriceController.text=="" &&
                                    //    variantNameController.text =='' ){
                                    //   createProductApi();
                                    // }
                                   // createProductApi();
                                    edit==true?editProduct():  createProductApi();


                                  });
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
                  ]),
                ),
              ),
              Container(
                height:
                    MediaQuery.of(context).size.height / 1, //height of button
                width: MediaQuery.of(context).size.width / 3,
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      color: const Color(0xffFFFFFF),
                      height: MediaQuery.of(context).size.height / 17,
                      //height of button
                      width: MediaQuery.of(context).size.width / 2.7,
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
                    displayProductNameList(),
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
              )
            ])));
  }

  bool veg = false;

  Widget addProductImages() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width / 4,
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
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 12,
                color: template1,
                child: SvgPicture.asset('assets/svg/Logo.svg'),
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
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 12,
                color: template2,
                child: SvgPicture.asset('assets/svg/Logo.svg'),
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
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 12,
                color: template3,
                child: SvgPicture.asset('assets/svg/Logo.svg'),
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
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 12,
                color: template4,
                child: SvgPicture.asset('assets/svg/Logo.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chooseVegOrNon() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 4,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width / 8.5,
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
                        setState(() {
                          veg = true;
                          color1 = Colors.orange;
                          color2 = Colors.transparent;
                        });
                      },
                      icon: SvgPicture.asset('assets/svg/veg.svg')),
                  const Text('Veg')
                ],
              ),
            ),
            onTap: () {
              setState(() {
                veg = true;
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
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 8.5,
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
                            color2 = Colors.orange;
                            color1 = Colors.transparent;
                            veg = false;
                          });
                        },
                        icon: SvgPicture.asset('assets/svg/nonveg.svg')),
                    const Text('Non Veg')
                  ])),
              onTap: () {
                setState(() {
                  color2 = Colors.orange;
                  color1 = Colors.transparent;
                  veg = false;
                });
              }),
        ],
      ),
      //color: Colors.red,
    );
  }

  Widget addProductNameDetail() {
    return ListView(shrinkWrap: true, children: [
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
        height: MediaQuery.of(context).size.height / 22,
        child: TextField(
          controller: productNameController,
          focusNode: productNameNode,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(categoryNode);
          },
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey)),
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const Text('Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      const SizedBox(height: 6),
      SizedBox(
        height: MediaQuery.of(context).size.height / 22,
        child: TextField(
          readOnly: true,
          onTap: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectCategory()),
            );

            print(result);

            if (result != null) {
              setState(() {
                categoryController.text = result;
              });
            } else {}
          },
          controller: categoryController,
          focusNode: categoryNode,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(descriptionNode);
          },
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: category,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey)),
            isDense: true,
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const Text('Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      const SizedBox(height: 6),
      TextField(
        controller: descriptionController,
        focusNode: descriptionNode,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(productPriceNode);
        },
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey)),
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 6),
      Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width / 2,
          //       color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Sales Price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                      child: TextField(
                        controller: salesPriceController,
                        focusNode: productPriceNode,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(purchasePriceNode);
                        },
                        // maxLines: 1,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          isDense: true,
                          contentPadding: EdgeInsets.all(14),
                          border: OutlineInputBorder(),
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
                width: MediaQuery.of(context).size.width / 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Purchase Price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                      child: TextField(
                        controller: purchasePriceController,
                        focusNode: purchasePriceNode,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(taxTypeNode);
                        },
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          isDense: true,
                          contentPadding: EdgeInsets.all(14),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            //here the container
          )),
      const Text('Tax Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      const SizedBox(height: 6),
      SizedBox(
        height: MediaQuery.of(context).size.height / 22,
        child: TextField(
          readOnly: true,
          onTap: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectTaxType()),
            );

            print(result);

            if (result != null) {
              setState(() {
                taxTypeController.text = result;
              });
            } else {}
          },
          controller: taxTypeController,
          focusNode: taxTypeNode,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus();
          },
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: taxType,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey)),
            isDense: true,
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }

  Widget displayProductNameList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.36, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      child: ListView.builder(
        controller:  productListController,
          shrinkWrap: true,
          itemCount: productLists.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height:
                  MediaQuery.of(context).size.height / 10, //height of button
              width: MediaQuery.of(context).size.width / 2.5,
              child: Card(
                margin: const EdgeInsets.all(4),
                child: ListTile(
                  onLongPress: (){
                    _showAlertDialog(productLists[index].id, "");


                  },
                  onTap: (){
                    edit=true;
                    ///mehtod
                    ProductDetail.product_id=productLists[index].id;
                   // ProductDetail.productUid=
                    getProductSingleView();
                  },

                  leading: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/customer.svg'),
                      iconSize: 40,
                    ),
                  ),
                  title: Text(productLists[index].productName),
                  subtitle: Text(productLists[index].defaultUnitName),
                  trailing:
                      Text(productLists[index].defaultSalesPrice.toString()),
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

  showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Name'),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (variantNameController.text != "" &&
                                variantPriceController.text != "") {
                              createVariantApi();
                            }
                          });
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  controller: variantNameController,
                  focusNode: variantNameNode,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(12),
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Price',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                        const SizedBox(height: 4),
                        Container(
                          width: MediaQuery.of(context).size.height / 6,
                          height: MediaQuery.of(context).size.height / 22,
                          child: TextField(
                            controller: variantPriceController,
                            focusNode: variantPriceNode,
                            // maxLines: 1,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(14),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Tax',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 6,
                          height: MediaQuery.of(context).size.height / 22,
                          child: TextField(
                            controller: variantTaxController,
                            focusNode: variantTaxNode,
                            decoration: const InputDecoration(
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(14),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        );
      },
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
                      deleteProduct(id, context),
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
  deleteProduct(id, BuildContext context) async {
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
        final url = '$baseUrl/posholds/delete/product/$custID/';
     //   String url="http://103.177.224.30:8080/api/v9/posholds/delete/product/$custID/";
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
        var status = n["StatusCode"]; //6000 status or messege is here
        print(response.body);
        print(status);
        if (status == 6000) {
          setState(() {
            productLists.clear();
            stop();
            getProductList();
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

  Future<Null> createVariantApi() async {
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
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';

       // const String url = "http://103.177.224.30:8080/api/v9/posholds/variant-create/";

        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/variant-create/';
        print(url);

        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "VariantName": variantNameController.text,
          "Amount": variantPriceController.text
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

  Future<Null> getVariantListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        HttpOverrides.global = MyHttpOverrides();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? "0";
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
   //     const String url = "http://103.177.224.30:8080/api/v9/posholds/variant-list/";
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/variant-list/';

        print(url);

        Map data = {"CompanyID": companyID, "BranchID": branchID};
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
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(status);
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();

            for (Map user in responseJson) {
              variantList.add(VariantListModel.fromJson(user));
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

  Future<Null> createProductApi() async {
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
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var categoryID = ProductDetail.category_id;
        var tax_ID = ProductDetail.taxID;

        var type = "";
        veg == true ? type = "veg" : type = "Non-veg";

        var accessToken = prefs.getString('access') ?? '';

   //   const String url ="http://103.177.224.30:8080/api/v9/posholds/product-create/";
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/product-create/';
        print(url);

        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "productImage1": "",
          "productImage2": "",
          "productImage3": "",
          "VegOrNonVeg": type,
          "ProductName": productNameController.text,
          "ProductGroupID": categoryID,
          "Description": descriptionController.text,
          "Price": 1,
          "TaxID": tax_ID,
          "Variant": var_id
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

  Future<Null> getProductList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        HttpOverrides.global = MyHttpOverrides();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? "0";
        var branchID = BaseUrl.branchID;

        var accessToken = prefs.getString('access') ?? '';
      //  const String url ="http://103.177.224.30:8080/api/v9/posholds/pos-product-list/";
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/pos-product-list/';

        print(url);

        Map data = {
          "CompanyID": companyID,
          "BranchID": branchID,
          "PriceRounding": 2,
          "GroupID": null
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
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(status);
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();
            productLists.clear();
            for (Map user in responseJson) {
              productLists.add(ProductListModel.fromJson(user));
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

  Future<Null> getProductSingleView() async {
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
        var productId=ProductDetail.product_id;
        var accessToken = prefs.getString('access') ?? '';
        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/single/product/$productId/';
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
        print(responseJson);
        if (status == 6000) {
          setState(() {
            stop();
            var productId=responseJson['ProductGroupID'];
            var taxId=responseJson['GST_ID'];
            productNameController.text=responseJson['ProductName'];
            salesPriceController.text=responseJson['DefaultSalesPrice'].toString();
            purchasePriceController.text=responseJson['DefaultPurchasePrice'].toString();
            descriptionController.text=responseJson['Description'];
            categoryController.text=responseJson['GroupName'];
            taxTypeController.text=responseJson['GST_ID'];



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


  Future<Null> editProduct() async {
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
        var userID = prefs.getInt("user_id");
        var branchID = BaseUrl.branchID;
        var categoryID = ProductDetail.category_id;
        var tax_ID = ProductDetail.taxID;
        var product_id=ProductDetail.product_id;


        var type = "";
        veg == true ? type = "veg" : type = "Non-veg";

        var accessToken = prefs.getString('access') ?? '';


        String baseUrl = BaseUrl.bUrl;
        final url = '$baseUrl/posholds/edit/product/$product_id/';

        print(url);

        Map data = {
          "BranchID": branchID,
          "CreatedUserID": userID,
          "CompanyID": companyID,
          "productImage1": "",
          "productImage2": "",
          "productImage3": "",
          "VegOrNonVeg": type,
          "ProductName": productNameController.text,
          "ProductGroupID": categoryID,
          "Description": descriptionController.text,
          "Price": 1,
          "TaxID": tax_ID,
          "Variant": var_id
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
            productLists.clear();
            var msg = n["message"];
            snackBarMessage(context, msg);
            stop();
            getProductList();
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

}




List<ProductListModel> productLists = [];

class ProductListModel {
  String productName, defaultUnitName, id;
  int defaultSalesPrice;

  ProductListModel(
      {required this.productName,
      required this.defaultSalesPrice,
      required this.defaultUnitName,
      required this.id});

  factory ProductListModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductListModel(
      defaultUnitName: json['DefaultUnitName'],
      defaultSalesPrice: json['DefaultSalesPrice'],
      productName: json['ProductName'],
      id: json['id'],
    );
  }
}

List<VariantListModel> variantList = [];

class VariantListModel {
  String uId, variantName, amount;
  int variantId;

  VariantListModel(
      {required this.uId,
      required this.amount,
      required this.variantId,
      required this.variantName});

  factory VariantListModel.fromJson(Map<dynamic, dynamic> json) {
    return VariantListModel(
      uId: json['id'],
      variantId: json['VariantID'],
      amount: json['Amount'],
      variantName: json['VariantName'],
    );
  }
}

class ProductDetail {
  static String product_id="";
  static String category_id = "";
  static String taxID = "";
  static String taxUid="";
  static String productUid="";

  static String veg = "";
  static String nonVeg = "";
}
