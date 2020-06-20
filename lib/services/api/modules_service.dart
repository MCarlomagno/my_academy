import 'package:my_academy/app/locator.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/sample_database.dart';

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
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.createModule(newModule);
  }

}
