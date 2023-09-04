import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{

  final String url ;
  NetworkHelper({
    required this.url,
  });

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.statusCode);
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}