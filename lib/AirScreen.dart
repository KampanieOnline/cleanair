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
                Text("Jakość powietrza"),
                Padding(padding: EdgeInsets.only(top: 2)),
                Text("Bardzo dobra"),
                Padding(padding: EdgeInsets.only(top: 24)),
                CircleAvatar(
                  radius: 91.0,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("23",
                            textAlign: TextAlign.center,),
                          Text("CAQI ⓘ",
                            textAlign: TextAlign.center,),
                        ],
                      )
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 28)),
                IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(
                                "10%",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 48,
                          color: Colors.white,
                          thickness: 1,
                        ),
                        Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("PM 10",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.2,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300))),
                              Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(
                                "12%",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 26.0,
                                        height: 1.2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text("Stacja pomiarowa"),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text("Warszawa"),

              ],
            )),
        Positioned(
            left: 8,
            bottom: 0,
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Stack(children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor: 1,
                      child: Image.asset('icons/danger-value-negative.png', scale: 0.9),
                  ),
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor: 1-0.4,
                    child: Image.asset('icons/danger-value.png', scale: 0.9),
                  ),
                )
              ],),
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
                  Padding(padding: EdgeInsets.only(
                    top:62.0, left:10, right: 10, bottom: 14),
                    child: Divider(
                        height: 10,
                        color: Colors.black,
                        thickness: 1,
                      )),
                        Padding(padding: EdgeInsets.only(
     left:10, right: 10, bottom: 24),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        color: Colors.white,
        child: Text("Wyjdź na dwór")
      ),
    )
                        ),
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
