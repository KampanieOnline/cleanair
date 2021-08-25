import 'dart:convert';
import 'dart:developer';

import 'package:clean_air/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'PermissionScreen.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  colors: [new Color(0xff6671e5), new Color(0xff4852d9)])),
        ),
        Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('icons/cloud-sun.png'),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42.0,
                      color: Colors.white,
                    ))),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja do monitorowania \n czystości powietrza',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ))),
              ],
            )),
        Positioned(
            left: 0,
            bottom: 35,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text("Przywiewam dane...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    color: Colors.white,
                  ))),
            ))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    if (permissionDenied()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
    }
  }

  bool permissionDenied() {
    return false;
  }

  void executeOnceAfterBuild() async {
    WeatherFactory wf = new WeatherFactory("b9b26b0a2dc98163b8412c022f815653",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName("Lublin");
    log(w.toJson().toString());

    var lat = 51.236686;
    var lon = 22.544199;
    var keyword = 'geo:$lat;$lon';
    String _endpoint = 'https://api.waqi.info/feed/';
    var key = '2130cefcb71430d9beddbee37cff2bbc2fcb2abc';
    String url = '$_endpoint$keyword/?token=$key';

    http.Response response = await http.get(Uri.parse(url));
    log(response.body.toString());

    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = new AirQuality(jsonBody);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(weather: w)));
  }
}

class AirQuality {
  bool isGood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int aqi = 0;
  int pm25 = 0;
  int pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody) {
    aqi = int.tryParse(jsonBody['data']['aqi'].toString()) ?? -1;
    pm25 = int.tryParse(jsonBody['data']['iaqi']['pm25']['v'].toString()) ?? -1;
    pm10 = int.tryParse(jsonBody['data']['iaqi']['pm10']['v'].toString()) ?? -1;
    station = jsonBody['data']['city']['name'].toString();
    setupLevel(aqi);
  }

  void setupLevel(int aqi) {
    if (aqi <= 100){
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrzaa i wyjdź na spacer";
    } else if (aqi <= 150){
      quality = "Nie za dobra";
      advice = "Jeśli tylko możesz zostań w domu, załatwiaj sprawy online";
    } else {
      quality = "Bardzo zła!";
      advice = "Zdecydowanie zostań w domu i załatwiaj sprawy online!";
    }
  }
}
