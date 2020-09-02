// import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHandler {
  final baseURL;

  ApiHandler(
    this.baseURL,
  );

  request(String type, String url, Map data) async {
    String parsedURL = '$baseURL$url';
    var response;

    switch (type) {
      case 'get':
        response = await http.get(parsedURL);
        break;
      default:
    }

    return response;
  }
}

String baseURL = 'https://ezdan-service-pap-development.herokuapp.com/api/v1';
ApiHandler instance = ApiHandler(baseURL);

Future get(url) => instance.request('get', url, {});
