// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String _geolocation = '';

  @override
  void initState() {
    super.initState();
    getLocation();
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

  void getLocation() async {
    var loc = Location();
    await loc.getCurrentLocation();

    var buffer = StringBuffer();

    buffer.writeln('Latitude: ${loc.latitude.toString()}');
    buffer.writeln('Longitude: ${loc.longitude.toString()}');

    _geolocation = buffer.toString();
    buffer.clear();

    print(_geolocation);
  }
}
