import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class AirScreen extends StatefulWidget {
  @override
  _AirScreenState createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: new Color(0xffffffff),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [new Color(0xff4acf8c), new Color(0xff75EDA6)])),
        ),
        Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Jakość powietrza",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                ),
                Padding(padding: EdgeInsets.only(top: 2)),
                Text(
                  "Bardzo dobra",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          height: 1.2,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                CircleAvatar(
                  radius: 91.0,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "23",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 64.0,
                                  height: 1.2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Text(
                          "CAQI ⓘ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ],
                    )),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 28)),
                IntrinsicHeight(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "PM 2,5",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.0)),
                          Text(
                            "10%",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 24,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "PM 10",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.0)),
                          Text(
                            "12%",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  "Stacja pomiarowa",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 12.0,
                          height: 1.2,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  "Warszawa",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                ),
                Padding(padding: EdgeInsets.only(top: 76)),
              ],
            )),
        Positioned(
            left: 8,
            bottom: (76.0) * 2,
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Stack(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 1,
                      child: Image.asset('icons/danger-value-negative.png',
                          scale: 0.9),
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: 1 - 0.4,
                      child: Image.asset('icons/danger-value.png',
                          color: Color(0xDD4ACF8C), scale: 0.9),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: 62.0, left: 10, right: 10, bottom: 14),
                      child: Divider(
                        height: 10,
                        color: Colors.black,
                        thickness: 1,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 24),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            height: 38.0,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage('icons/happy.png'),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8.0)),
                                  Text(
                                    "Skorzystaj z dobrego powietrza i wyjdź na dwór",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 14.0,
                                            height: 1.2,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ))),
                  )
                ],
              ),
            ))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool havePermissionToAsk() {
    return true;
  }
}
