import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsersService {
  String url = Enviroment.apiUrl + "/users";
  Map<String, String> headers = {'Content-Type': 'application/json'};

  int _currentUserId = 1;
  int get currentUserId => this._currentUserId;

  bool _isLoggedIn;
  bool get isLoggedIn => this._isLoggedIn;

  User _user;
  User get user => this._user;

  setUser(User newUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._isLoggedIn = true;
    this._user = newUser;

    await prefs.setBool('isLoggedIn', this._isLoggedIn);
    await prefs.setInt('id', this._user.id);
    await prefs.setString('email', this._user.email);
    await prefs.setString('name', this._user.name);
    await prefs.setString('surname', this._user.surname);
    await prefs.setString('imageUrl', this._user.imageUrl ?? "");
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (this._isLoggedIn) {
      this._user = User(
          id: prefs.getInt('id'),
          email: prefs.getString('email'),
          name: prefs.getString('name'),
          surname: prefs.getString('surname'),
          imageUrl: prefs.getString('imageUrl') ?? "");
    }
  }

  Future<User> getUserById(int userId) async {
    try {
      var getUserByIdUrl = this.url + '/' + userId.toString();
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.get(getUserByIdUrl);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      var userJson = jsonDecode(response.body);
      User user = User.fromJson(userJson);
      return user;
    } catch (e) {
      print(e);
      throw Exception('Ocurrio un error buscando cursos');
    }
  }

  Future<User> login(String email, String password) async {
    var loginUrl = this.url + '/login';
    int beforeRequest = DateTime.now().millisecondsSinceEpoch;
    var body = {"email": email, "password": password};
    var response = await http.post(loginUrl, body: jsonEncode(body), headers: headers);
    int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
    print('latencia:' + latency.toString());
    if (response.statusCode == 404) {
      print('email not found');
      throw PlatformException(code: response.statusCode.toString(), message: "Email inexistente");
    } else if (response.statusCode == 403) {
      print('Invalid password');
      throw PlatformException(code: response.statusCode.toString(), message: "Contaseña inválida");
    } else {
      var userJson = jsonDecode(response.body);
      User user = User.fromJson(userJson);
      await this.setUser(user);
      this._user = user;
      return user;
    }
  }

  Future<User> signUp(User user) async {
    var signUpUrl = this.url + '/signUp';
    print(signUpUrl);
    int beforeRequest = DateTime.now().millisecondsSinceEpoch;
    var body = user.toJson();
    print(body);
    var response = await http.post(signUpUrl, body: jsonEncode(body), headers: headers);
    int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
    print('latencia:' + latency.toString());
    if (response.statusCode == 401) {
      print('Cuenta existente');
      throw PlatformException(code: response.statusCode.toString(), message: "Cuenta existente");
    } else {
      var userJson = jsonDecode(response.body);
      User user = User.fromJson(userJson);
      this.setUser(user);
      return user;
    }
  }
}
