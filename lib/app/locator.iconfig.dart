// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_academy/services/third_party_services_module.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/api/sample_database.dart';
import 'package:my_academy/services/api/sample_service.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
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
  g.registerLazySingleton<SampleDataBase>(
      () => thirdPartyServicesModule.sampleDataBase);
  g.registerLazySingleton<SampleService>(
      () => thirdPartyServicesModule.quandlService);
  g.registerLazySingleton<VideoDataService>(
      () => thirdPartyServicesModule.videoDataService);
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
  SampleDataBase get sampleDataBase => SampleDataBase();
  @override
  SampleService get quandlService => SampleService();
  @override
  VideoDataService get videoDataService => VideoDataService();
}
