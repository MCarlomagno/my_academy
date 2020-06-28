import 'dart:convert';

import 'package:my_academy/app/locator.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/sample_database.dart';
import 'package:http/http.dart' as http;

class ModulesService {
  String url = Enviroment.apiUrl + "/modules";
  SampleDataBase _sampleDataBase = locator<SampleDataBase>();

  Future<List<Module>> getModulesByCourseId(int courseId) async {
    print('antes del await');
    await Future.delayed(Duration(seconds: 3));
    print('despues del await');
    return _sampleDataBase.getModulesByCourseId(courseId);
  }

  Future<Module> createModule(Module newModule) async {
    try {
      var body = jsonEncode(newModule.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url, body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
    } catch (e) {}
    return newModule;
  }
}
