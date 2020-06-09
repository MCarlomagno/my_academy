import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';

class CreateCourseViewModel extends BaseViewModel {
  Module sampleModule = Module(
      title: 'Un modulo increible',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: [Class(), Class()]);
  Module sampleModule2 = Module(
      title: 'Otro modulo inolvidable',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: [Class()]);
  Module sampleModule3 = Module(
      title: 'Otro modulo inolvidable',
      description: 'Este es un modulo excelente que contiene una lista de clases para aprender!',
      classes: [Class()]);
  List<Module> modules = [];

  onModelReady() {
    modules.add(sampleModule);
    modules.add(sampleModule2);
    modules.add(sampleModule3);
  }
}
