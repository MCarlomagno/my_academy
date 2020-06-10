import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';

class CreateCourseDetailViewModel extends BaseViewModel {
  Class clase1 = Class(title: 'Clase 1', description: 'Descripcion clase 1');
  Class clase2 = Class(title: 'Clase 2', description: 'Descripcion clase 2');
  Class clase3 = Class(title: 'Clase 3', description: 'Descripcion clase 3');
  Module sampleModule = Module(
      title: 'Un modulo increible asdasd asdasd asd',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: []);
  Module sampleModule2 = Module(
      title: 'Otro modulo inolvidable',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: []);
  Module sampleModule3 = Module(
      title: 'Otro modulo inolvidable',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: []);
  List<Module> modules = [];

  onModelReady() {
    sampleModule.classes = [clase1, clase2, clase3];
    sampleModule2.classes = [clase1, clase2, clase3];
    sampleModule3.classes = [clase1, clase2, clase3];
    modules.add(sampleModule);
    modules.add(sampleModule2);
    modules.add(sampleModule3);
  }
}
