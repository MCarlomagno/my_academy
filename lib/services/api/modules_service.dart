import 'package:my_academy/models/module_model.dart';

class ModulesService {

    List<Module> allModulesSampleData = [
      Module(title: 'Modulo 1', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modul', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo asdasd asdasd', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo sdfdf as', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo asfafdffgd asdasd', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo sdf', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo dfgdfh', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo asd', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'asd Modulo asdasd', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
      Module(title: 'Modulo asdasdasd', description: 'Este modulo va a tratar sobre algo interesante de lo que no quiero hablar',classes: []),
    ];


    Future<List<Module>> getAllModules() async {
    await Future.delayed(Duration(seconds: 3));
    return allModulesSampleData;
  }
}