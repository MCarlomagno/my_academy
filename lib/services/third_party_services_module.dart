import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:injectable/injectable.dart';
import 'package:my_academy/services/ui_services/search_view_service.dart';
import 'package:my_academy/services/ui_services/teach_view_service.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api/sample_database.dart';
import 'api/users_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  CoursesService get coursesService;
  @lazySingleton
  ClassesService get classesService;
  @lazySingleton
  ModulesService get modulesService;
  @lazySingleton
  SampleDataBase get sampleDataBase;
  @lazySingleton
  UsersService get usersService;
  @lazySingleton
  VideoDataService get videoDataService;
  @lazySingleton
  TeachViewService get testViewService;
  @lazySingleton 
  SearchViewService get searchViewService;
}