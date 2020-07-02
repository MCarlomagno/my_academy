import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/ui_services/teach_view_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeachViewModel extends ReactiveViewModel {

  //service injection
  final NavigationService _navigationService = locator<NavigationService>();
  final TeachViewService _teachViewService = locator<TeachViewService>();
  final CoursesService _coursesService = locator<CoursesService>();

  @override
  bool get isBusy => this._teachViewService.loading;

  List<Course> get createdCourses => this._teachViewService.createdCourses;

  onModelReady() async {
    _teachViewService.loadList();
  }

  onCreate() async {
    await _navigationService.navigateTo(Routes.createCourseView);
  }

  popUpButtonPressed(value) {
    if(value == 1) {
      _teachViewService.loadList();
    }
  }

  Future<void> reload() async {
    await _teachViewService.reloadList();
    notifyListeners();
    return;
  }

  /// To make the service reactive (listen variable changes)
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_teachViewService];

}