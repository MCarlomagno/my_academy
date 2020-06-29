import 'dart:convert';

import 'package:my_academy/app/locator.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/services/api/sample_database.dart';
import 'package:http/http.dart' as http;

class ClassesService {
  String url = Enviroment.apiUrl + "/classes";
  SampleDataBase _sampleDataBase = locator<SampleDataBase>();

  Future<List<Class>> getClassesByModuleId(int moduleId) async {
    List<Class> classes = _sampleDataBase.getClassesByModuleId(moduleId);
    await Future.delayed(Duration(seconds: 3));
    return classes;
  }

  Future<Class> createClass(Class currentClass) async {
    try {
      String body = jsonEncode(currentClass.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url,body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
      return Class.fromJson(jsonDecode(response.body));
    }catch (e) {
      print(e);
      throw Exception('Ocurrio un error creando el curso');
    }
  }
}
