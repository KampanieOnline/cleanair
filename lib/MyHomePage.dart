import 'package:clean_air/AirScreen.dart';
import 'package:clean_air/WeatherScreen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  final screens = [
    AirScreen(),
    WeatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(()=>_currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.masks_outlined), label: "Powietrze"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_cloudy_outlined), label: "Pogoda")
        ],
      ),
    );
  }
}
