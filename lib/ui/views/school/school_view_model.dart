import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

class SchoolViewModel extends BaseViewModel {
  List<Course> _myCourses = [];
  List<Course> get myCourses => this._myCourses;

  
  CoursesService _coursesService = locator<CoursesService>();

  onModelReady() async {
    setBusy(true);
    this._myCourses = await _coursesService.getUserEnrolledCourses();
    setBusy(false);
  }

  Future<void> reload() async {
    this._myCourses = await _coursesService.getUserEnrolledCourses();
    notifyListeners();
    return;
  }

}