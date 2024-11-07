import 'dart:convert';

class Credential {
  int? id;
  String firstname;
  String lastname;
  String email;
  String number;
  String username;
  String password;

  Credential(
      {required this.firstname,
      required this.lastname,
      required this.username,
      required this.number,
      required this.password,
      required this.email,
      this.id});

  factory Credential.fromJson(Map json) {
    return Credential(
        id: json['id'] ?? 0,
        firstname: json['firstname'] ?? 'unknown',
        lastname: json['lastname'] ?? 'unknown',
        number: json['number'] ?? '00000000000',
        username: json['username'] ?? 'unknown',
        password: json['password'] ?? ' ',
        email: json['email'] ?? 'unknown');
  }

  Map toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'number': number,
      'username': username,
      'password': password,
      'email': email
    };
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
