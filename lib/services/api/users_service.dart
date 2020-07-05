import 'dart:convert';

import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/user_model.dart';
import 'package:http/http.dart' as http;

class UsersService {
  String url = Enviroment.apiUrl + "/users";

  int _currentUserId = 1;
  int get currentUserId => this._currentUserId;

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
}
