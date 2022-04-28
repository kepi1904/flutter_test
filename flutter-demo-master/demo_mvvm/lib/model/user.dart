import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String avatar;

  User(
      {this.id = 0,
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.avatar = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  static Future<User> loadUser(int id) async {
    final url = Uri.parse("https://reqres.in/api/users/" + id.toString());
    var response = await http.get(url);
    var jsonObject = json.decode(response.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    User user = User.fromJson(userData);
    return user;
  }
}

class UninitializedUser extends User {}
