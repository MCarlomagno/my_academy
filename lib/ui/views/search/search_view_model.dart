import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/ui_services/search_view_service.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {

  /// service injection
  SearchViewService _searchViewService = locator<SearchViewService>();
  CoursesService _coursesService = locator<CoursesService>();

  List<Course> _courses = [];
  List<Course> get courses => this._courses;  

  onModelReady() async {
    setBusy(true);
    this._courses = await _coursesService.getAllCourses();
    setBusy(false);
  }

  Future<void> reload() async {
    this._courses = await _coursesService.getAllCourses();
    notifyListeners();
    return;
  }

  
}