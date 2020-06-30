import 'dart:convert';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:http/http.dart' as http;

class ClassesService {
  String url = Enviroment.apiUrl + "/classes";

  Future<List<Class>> getClassesByModuleId(int moduleId) async {
    try {
      List<Class> classes = [];
      var getClassesByModuleIdUrl = this.url + '/getClassesByModuleId/' + moduleId.toString();
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.get(getClassesByModuleIdUrl);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      var classesJson = jsonDecode(response.body);
      for (var classJson in classesJson) {
        classes.add(Class.fromJson(classJson));
      }
      return classes;
    } catch (e) {
      print(e);
      throw Exception('Ocurrio un error buscando clases');
    }
  }

  Future<Class> createClass(Class currentClass) async {
    try {
      String body = jsonEncode(currentClass.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url, body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
      return Class.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw Exception('Ocurrio un error creando el curso');
    }
  }
}
