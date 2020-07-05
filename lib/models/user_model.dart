import 'package:flutter/cupertino.dart';

class User {
  int id;
  String name;
  String surname;
  String email;
  String imageUrl;

  User({@required this.id, @required this.name, @required this.surname, @required this.email, @required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "surname": this.surname,
      "email": this.email,
      "imageUrl": this.imageUrl
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
