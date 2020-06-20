import 'package:my_academy/app/locator.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/services/api/sample_database.dart';

class ClassesService {
  String url = Enviroment.apiUrl + "/classes";
  SampleDataBase _sampleDataBase = locator<SampleDataBase>();

  Future<List<Class>> getClassesByModuleId(int moduleId) async {
    List<Class> classes = _sampleDataBase.getClassesByModuleId(moduleId);
    await Future.delayed(Duration(seconds: 3));
    return classes;
  }

  Future<Class> createClass(Class currentClass) async {
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.createClass(currentClass);
  }
}
