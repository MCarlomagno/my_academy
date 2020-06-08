import 'package:my_academy/api/courses_service.dart';
import 'package:my_academy/api/sample_service.dart';
import 'package:injectable/injectable.dart';
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
}