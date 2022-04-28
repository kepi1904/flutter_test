import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginHandler {
  static Future<String> login(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    Map data = {'email': email, 'password': password};

    var response = await http.post(url, body: data);
    var jsonBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonBody['token'];
    } else {
      return 'failed';
    }
  }
}
