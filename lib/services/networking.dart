import 'package:http/http.dart';

class NetworkHelper {
  String url;

  NetworkHelper({required this.url});

  Future<String> getData() async {
    var response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    }
    return '';
  }
}
