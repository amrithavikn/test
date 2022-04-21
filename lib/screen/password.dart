import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

Color c1 = Colors.white;
Color c2 = Colors.white;
Color c3 = Colors.white;
Color c4 = Colors.white;
Color c5 = Colors.white;
Color c6 = Colors.white;

Color c7 = Colors.white;
Color c8 = Colors.white;
Color c9 = Colors.white;
Color c10 = Colors.white;


var number=1;
var ind=1;

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height:
                MediaQuery.of(context).size.height / 1.2, //height of button
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                    children: [
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height /
                          16, //height of button
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Text(
                        'Enter PIN',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height /
                        16, //height of button
                    width: MediaQuery.of(context).size.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c1,
                              border: Border.all(color: Color(0xff707070))),

                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c2,
                              border: Border.all(color: Color(0xff707070))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c3,
                              border: Border.all(color: Color(0xff707070))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:c4,
                              border: Border.all(color: Color(0xff707070))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c5,
                              border: Border.all(color: Color(0xff707070))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /
                              38, //height of button
                          width: MediaQuery.of(context).size.width / 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c6,
                              border: Border.all(color: Color(0xff707070))),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height /7,
                    padding: EdgeInsets.all(14),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {
                               // print(1);
                                setState(() {
                                  c1=Colors.black;
                                  c2=Colors.white;
                                });

                              },
                              icon: const Text('1',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                           child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c2=Colors.black;
                                  c1=Colors.black;
                                });
                              },
                              icon: const Text('2',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c3=Colors.black;
                                  c1=Colors.black;
                                  c2=Colors.black;
                                });
                              },
                              icon: const Text('3',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(


                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height /7,
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c4=Colors.black;
                                  c3=Colors.black;
                                  c1=Colors.black;
                                  c2=Colors.black;
                                });
                              },
                              icon: const Text('4',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c5=Colors.black;
                                  c4=Colors.black;
                                  c3=Colors.black;
                                  c1=Colors.black;
                                  c2=Colors.black;

                                });
                              },
                              icon: const Text('5',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  c6=Colors.black;
                                  c4=Colors.black;
                                  c3=Colors.black;
                                  c1=Colors.black;
                                  c2=Colors.black;
                                  c5=Colors.black;

                                });
                              },
                              icon: const Text('6',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height /7,
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Text('7',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Text('8',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Text('9',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),

                        ),
                      ],
                    ),
                  ),//
                  Container(


                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height /7,
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,

                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Text('0',style: TextStyle(color: Color(0xff000000),fontSize: 24,fontWeight: FontWeight.w600),)
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 11, //height of button
                          width: MediaQuery.of(context).size.width / 17,

                          child: IconButton(

                            tooltip: 'clear fields',

                            onPressed: () {
                              setState(() {
                              c6=Colors.white;
                              c4=Colors.white;
                              c3=Colors.white;
                              c1=Colors.white;
                              c2=Colors.white;
                              c5=Colors.white;

                            });

                            },
                            icon: SvgPicture.asset('assets/svg/backspace.svg'),iconSize: 60,
                          ),

                        ),
                      ],
                    ),

                  ),
                  Container(

                    height: MediaQuery.of(context).size.height /
                        11, //height of button
                    width: MediaQuery.of(context).size.width / 2.5,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('2020 | Vikncodes LLP | All Rights Reserved'),
                        Text('www.vikncodes.com')
                      ],
                    ),

                  )


                ])
            )

        )
    );

  }




  changeColor(int number) {
    if (number == 1) {
      return Color(0xff000000);
    }
    else if (number == 2) {
      return Color(0xff000000);
    } else if (number == 3) {
      return Color(0xff000000);
    } else if (number == 4) {
      return Color(0xff000000);
    } else if (number == 5) {
      return Color(0xff000000);
    } else if (number == 6) {
      return Color(0xff000000);
    } else if (number == 7) {
      return Color(0xff000000);
    } else if (number == 8) {
      return Color(0xff000000);
    } else if (number == 9) {
      return Color(0xff000000);
    } else if (number == 10) {
      return Color(0xff000000);
    }
    else {
      return Colors.white;
    }
  }}


