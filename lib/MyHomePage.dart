import 'package:clean_air/AirScreen.dart';
import 'package:clean_air/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.weather});

  final Weather weather;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 1;
  var screens;

  @override
  void initState() {
    screens = [
      AirScreen(),
      WeatherScreen(weather: widget.weather),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 38,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("icons/house.png"), label: "Powietrze", activeIcon: Image.asset("icons/house-checked.png")),
          BottomNavigationBarItem(
              icon: Image.asset("icons/cloud.png"), label: "Pogoda", activeIcon: Image.asset("icons/cloud-checked.png")),
        ],
      ),
    );
  }
}
