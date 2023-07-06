// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String _geolocation = '';
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text(
            _geolocation,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  void getLocationData() async {
    await _location.getCurrentLocation();

    var network = NetworkHelper(
      url: 'https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=c66ee4356297008ed6780332e1a665f9',
    );

    var data = jsonDecode(await network.getData());
    double temp = data['main']['temp'] - 273.15;
    print(temp.round().toStringAsFixed(2));
  }
}
