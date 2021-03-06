// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:my_academy/services/third_party_services_module.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_academy/services/api/enrollments_service.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/ui_services/search_view_service.dart';
import 'package:my_academy/services/ui_services/teach_view_service.dart';
import 'package:my_academy/services/api/users_service.dart';
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
  g.registerLazySingleton<EnrollmentsService>(
      () => thirdPartyServicesModule.enrollmentsService);
  g.registerLazySingleton<ModulesService>(
      () => thirdPartyServicesModule.modulesService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SearchViewService>(
      () => thirdPartyServicesModule.searchViewService);
  g.registerLazySingleton<TeachViewService>(
      () => thirdPartyServicesModule.testViewService);
  g.registerLazySingleton<UsersService>(
      () => thirdPartyServicesModule.usersService);
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
  EnrollmentsService get enrollmentsService => EnrollmentsService();
  @override
  ModulesService get modulesService => ModulesService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SearchViewService get searchViewService => SearchViewService();
  @override
  TeachViewService get testViewService => TeachViewService();
  @override
  UsersService get usersService => UsersService();
  @override
  VideoDataService get videoDataService => VideoDataService();
}
