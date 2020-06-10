// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_academy/services/third_party_services_module.dart';
import 'package:my_academy/api/classes_service.dart';
import 'package:my_academy/api/courses_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_academy/api/modules_service.dart';
import 'package:my_academy/api/sample_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<ClassesService>(
      () => thirdPartyServicesModule.classesService);
  g.registerLazySingleton<CoursesService>(
      () => thirdPartyServicesModule.coursesService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<ModulesService>(
      () => thirdPartyServicesModule.modulesService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SampleService>(
      () => thirdPartyServicesModule.quandlService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  ClassesService get classesService => ClassesService();
  @override
  CoursesService get coursesService => CoursesService();
  @override
  DialogService get dialogService => DialogService();
  @override
  ModulesService get modulesService => ModulesService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SampleService get quandlService => SampleService();
}
