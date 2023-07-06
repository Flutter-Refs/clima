// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  String url;

  NetworkHelper({required this.url});

  Future getData() async {
    var response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
