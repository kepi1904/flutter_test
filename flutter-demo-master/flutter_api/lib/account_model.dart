import 'dart:convert';
import 'package:http/http.dart' as http;

class Account {
  late String id;
  late String name;
  late String job;
  late String created;

  Account({this.id = '', this.name = '', this.job = '', this.created = ''});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json["id"],
        name: json["name"],
        job: json["job"],
        created: json["createdAt"]);
  }

  static Future<Account> createAccount(String name, String job) async {
    final url = Uri.parse('https://reqres.in/api/users');
    final response = await http.post(url, body: {"name": name, "job": job});
    if (response.statusCode == 201) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create account!');
    }
  }
}
