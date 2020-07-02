import 'dart:convert';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:http/http.dart' as http;

class ModulesService {
  String url = Enviroment.apiUrl + "/modules";

  Future<List<Module>> getModulesByCourseId(int courseId) async {
    try {
      List<Module> modules = [];
      var getModulesByCourseIdUrl = this.url + '/getModulesByCourseId/' + courseId.toString();
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.get(getModulesByCourseIdUrl);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      var modulesJson = jsonDecode(response.body);
      for(var moduleJson in modulesJson) {
        modules.add(Module.fromJson(moduleJson));
      }
      return modules;
    }catch (e) {
      print(e);
      throw Exception('Ocurrio un error buscando modulos');
    }
  }

  Future<Module> createModule(Module newModule) async {
    try {
      var body = jsonEncode(newModule.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url, body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
      return Module.fromJson(jsonDecode(response.body));
    } catch (e) {}
    return newModule;
  }
}
