import 'package:my_academy/models/class_model.dart';

class ClassesService {
  List<Class> allClassesSampleData = [
    Class(title: 'Clase 1', description: 'Descripcion de la clase 1, esta clase tiene una descropcin'),
    Class(title: 'Clase 2 asdasdads', description: 'Descripcion de la clase 1, esta clase tiene una descropcin'),
    Class(title: 'Clas', description: 'Descripcion de la clase 1, esta clase tiene una descropcin'),
    Class(title: 'Clase asdasd asdasd asd', description: 'Descripcion de la clase 1, esta clase tiene una descropcin'),
    Class(title: 'Clase asd', description: 'Descripcion de la clase 1, esta clase tiene una descropcin'),
  ];

  Future<List<Class>> getAllCourses() async {
    await Future.delayed(Duration(seconds: 1));
    return allClassesSampleData;
  }

}
