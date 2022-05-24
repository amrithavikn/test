import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
                  'Report',
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
                        height: MediaQuery.of(context).size.height /
                            1, //height of button
                        width: MediaQuery.of(context).size.width / 2.4,
                        //   color: Colors.red[100],
                        child: Column(children: [
                          tableHeaderDetail()  ,
                          productDetailList()   ,
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                17, //height of button
                            width: MediaQuery.of(context).size.width / 1,
                          //  color: Colors.red,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height /
                                            13,
                                        width:
                                        MediaQuery.of(context).size.width /
                                            22,
                                        //   color:Colors.limeAccent,
                                        child: const Text('Tax'),
                                      ),
                                      SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height /
                                            13,
                                        width:
                                        MediaQuery.of(context).size.width /
                                            11,
                                        // color:Colors.red,
                                        child: const Text(' Rs.2123.00 ',
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height / 13,
                                    width:
                                    MediaQuery.of(context).size.width / 8,
                                    //   color:Colors.limeAccent,
                                    child: const Text(
                                      'Total:Rs.2123.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ]),
                          )
                        ]),
                      ))),
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
                                  13, //height of button
                              width: MediaQuery.of(context).size.width / 2.5,
                              color: Colors.white,
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            tableDetailList()  ,
                            printAndExportDetailBottom()
                          ],
                        ))),
              )
            ])));
  }
  Widget tableHeaderDetail(){
    return  SizedBox(
      height: MediaQuery.of(context).size.height /
          13, //height of button
      width: MediaQuery.of(context).size.width / 1,
      // color: Colors.blue[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height /
                13, //height of button
            width: MediaQuery.of(context).size.width / 3,
            // color: Colors.green[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Table 1 ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left),
                Text('(savad farooque) ',
                    style: TextStyle(
                      // fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height /
                13, //height of button
            width: MediaQuery.of(context).size.width / 4,
            // color: Colors.blue[100],)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('<Date & Time>')
              ],
            ),

          )
        ],
      ),
    );
  }
  Widget productDetailList(){
    return SizedBox(
        height: MediaQuery.of(context).size.height /
            1.35, //height of button
        width: MediaQuery.of(context).size.width / 1.1,
        //color: Colors.yellow[100],

        //color: Colors.red,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Colors.grey, width: .5),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height /
                            11,
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            5.5,
                        //  color:Colors.red,
                        child: Column(
                          //  mainAxisSize: MainAxisSize.max,
                          //alignment changed
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                                'plate mexican beef shawarma ',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold)),
                            SizedBox(
                              height: 2,
                            ),
                            Text('Description')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height /
                            11,
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            5.5,
                        // color: Colors.green,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('Rate ',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w500)),
                            Text('Quantity',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w500)),
                            Text('Extra Spicy',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight:
                                    FontWeight.w300))
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              11,
                          width: MediaQuery.of(context)
                              .size
                              .width /
                              5.5,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisSize:
                            MainAxisSize.max,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Tax',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w500)),
                              Text('Gross amt',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w500)),
                              Text('Net total:',
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .bold))
                            ],
                          )),
                    ]),
              );
            }));
  }
  Widget tableDetailList(){
    return SizedBox(
      height: MediaQuery.of(context).size.height /
          1.35, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      //   color: Colors.purple[100],),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder:
              (BuildContext context, int index) {
            return Card(
                child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height /
                            13,
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            11,
                        // color:Colors.red,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('Table 1 ',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold)),
                            Text('<Customer>')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height /
                            13,
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            10,
                        //   color:Colors.limeAccent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('<Date & Time>')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height /
                            15,
                        width: MediaQuery.of(context)
                            .size
                            .width /
                            14,
                        //  color:Colors.blue,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text('<Total>',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold))
                          ],
                        ),
                      ),
                    ]));
          }),
    );
  }
  Widget printAndExportDetailBottom(){
    return SizedBox(
      height: MediaQuery.of(context).size.height /
          16, //height of button
      width: MediaQuery.of(context).size.width / 2.5,
      //  color: Colors.red[100],
      child: Row(
        //mainAxisAlignment:
        // MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height:
                MediaQuery.of(context).size.height /
                    20,
                width:
                MediaQuery.of(context).size.width /
                    9,
                //    color:Colors.blue,
                child: TextButton(
                  style: TextButton.styleFrom(
                    // padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    textStyle:
                    const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('Export'),
                )),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height:
              MediaQuery.of(context).size.height /
                  20,
              width:
              MediaQuery.of(context).size.width / 9,
              //  color:Colors.red,
              child: TextButton(
                style: TextButton.styleFrom(
                  // padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle:
                  const TextStyle(fontSize: 15),
                ),
                onPressed: () {},
                child: const Text('Print'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                height:
                MediaQuery.of(context).size.height /
                    13,
                width:
                MediaQuery.of(context).size.width /
                    16.5,
                //  color:Colors.limeAccent,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                      'assets/svg/filter.svg'),
                  iconSize: 44,
                )),
          ]),
    );
  }
}
