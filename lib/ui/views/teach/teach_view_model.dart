import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeachViewModel extends BaseViewModel {

  List<Course> _createdCourses;
  List<Course> get createdCourses => this._createdCourses;

  //service injection
  final NavigationService _navigationService = locator<NavigationService>();
  final CoursesService _coursesService = locator<CoursesService>();

  onModelReady() async {
    setBusy(true);
    this._createdCourses = await _coursesService.getUserCreatedCourses();
    setBusy(false);
  }

  onCreate() async {
     await _navigationService.navigateTo(Routes.createCourseView);
  }
}