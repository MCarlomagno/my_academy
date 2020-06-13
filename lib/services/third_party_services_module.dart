import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/api/sample_service.dart';
import 'package:injectable/injectable.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SampleService get quandlService;
  @lazySingleton
  CoursesService get coursesService;
  @lazySingleton
  ClassesService get classesService;
  @lazySingleton
  ModulesService get modulesService;
  @lazySingleton
  VideoDataService get videoDataService;
}