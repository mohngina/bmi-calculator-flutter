import 'dart:convert';
import 'package:http/http.dart' as http;

class NetOps {
  var data;

  logIn(String email, String password) async {
    String url =
        'https://ezdan-service-pap-development.herokuapp.com/api/v1/accounts/login/';

    try {
      var response =
          await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return data = jsonDecode(response.body);
      } else {
        return 2;
      }
    } catch (e) {
      return e;
    }
  }
}
