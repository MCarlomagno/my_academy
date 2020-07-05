import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {

  /// service injection
  final CoursesService _coursesService = locator<CoursesService>();

  List<Course> _courses = [];
  List<Course> get courses => this._courses;  

  List<Course> _recommendedCourses = [];
  List<Course> get recommendedCourses => this._recommendedCourses;  

  List<Course> _popularCourses = [];
  List<Course> get popularCourses => this._popularCourses;  

  List<Course> _lastCourses = [];
  List<Course> get lastCourses => this._lastCourses;  

  onModelReady() async {
    setBusy(true);
    this._courses = await _coursesService.getAllCourses();
    for(var course in courses) {
      if(courses.indexOf(course) < 5) {
        _recommendedCourses.add(course);
      }else if(courses.indexOf(course) >= 5 && courses.indexOf(course) < 10) {
        _popularCourses.add(course);
      }else if(courses.indexOf(course) >= 10 && courses.indexOf(course) < 15) {
        _lastCourses.add(course);
      }
    }
    setBusy(false);
  }

  Future<void> reload() async {
    this._courses = await _coursesService.getAllCourses();
    notifyListeners();
    return;
  }
  
}