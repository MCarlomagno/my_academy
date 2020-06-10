import 'package:my_academy/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  List<Course> _courses = [];
  List<Course> get courses => this._courses;

  
  CoursesService _coursesService = locator<CoursesService>();

  onModelReady() async {
    setBusy(true);
    print('busy en true');
    this._courses = await _coursesService.getAllCourses();
    print('busy en false');
    setBusy(false);
  }

  
}