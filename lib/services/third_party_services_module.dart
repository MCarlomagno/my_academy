import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/api/sample_service.dart';
import 'package:injectable/injectable.dart';
import 'package:my_academy/services/ui_services/teach_view_service.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api/sample_database.dart';

@module
abstract class ThirdPartyServicesModule {

  /// [Third party] services
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;

  /// [API] services
  @lazySingleton
  SampleService get quandlService;
  @lazySingleton
  CoursesService get coursesService;
  @lazySingleton
  ClassesService get classesService;
  @lazySingleton
  ModulesService get modulesService;
  @lazySingleton
  SampleDataBase get sampleDataBase;


  /// [UI] services
  @lazySingleton
  VideoDataService get videoDataService;
  @lazySingleton
  TeachViewService get testViewService;
}