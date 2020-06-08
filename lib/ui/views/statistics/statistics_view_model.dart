import 'package:my_academy/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:stacked/stacked.dart';

class StatisticsViewModel extends BaseViewModel {

  //Services injection
  CoursesService _coursesService = locator<CoursesService>();

  int _totalUserCourses;
  int get totalUserCourses => this._totalUserCourses;

  onModelReady() {
    this._totalUserCourses = _coursesService.getTotalUserCourses();
    notifyListeners();
  }
}