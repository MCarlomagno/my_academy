import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:observable_ish/value/value.dart';
import 'package:stacked/stacked.dart';

class TeachViewService with ReactiveServiceMixin {

  // api service injection
  final CoursesService _coursesService = locator<CoursesService>();

  RxValue<List<Course>> _createdCourses = RxValue<List<Course>>(initial: []);
  List<Course> get createdCourses => this._createdCourses.value;

  RxValue<bool> _loading = RxValue<bool>(initial: false);
  bool get loading => this._loading.value;

  TeachViewService() {
    listenToReactiveValues([_createdCourses,_loading]);
  }

  loadList() async {
    print('List reloaded!');
    this._loading.value = true;
    this._createdCourses.value = await _coursesService.getUserCreatedCourses();
    this._loading.value = false;
  }

}