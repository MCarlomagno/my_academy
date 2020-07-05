import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/models/enrollment_model.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/enrollments_service.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';

class CourseOnDetailViewModel extends BaseViewModel {
  ModulesService _modulesService = locator<ModulesService>();
  EnrollmentsService _enrollmentsService = locator<EnrollmentsService>();
  CoursesService _coursesService = locator<CoursesService>();
  UsersService _usersService = locator<UsersService>();

  List<Module> _modules = [];
  List<Module> get modules => this._modules;

  bool _enrollingCourse = false;
  bool get enrollingCourse => this._enrollingCourse;

  bool _enrolledToCourse = true;
  bool get enrolledToCourse => this._enrolledToCourse;

  onModelReady(int courseId) async {
    setBusy(true);
    List<Course> courses = await _coursesService.getUserEnrolledCourses();

    // If there are no user enrollments with the same id as the current course 
    if(!(courses.any((element) => element.id == courseId))) {
      this._enrolledToCourse = false;
      notifyListeners();
    }
    
    this._modules = await _modulesService.getModulesByCourseId(courseId);
    setBusy(false);
  }

  Future<void> enrollCourse(int courseId) async {
    this._enrollingCourse = true;
    notifyListeners();

    Enrollment _enrollment = Enrollment(courseId: courseId, userId: _usersService.currentUserId);
    await _enrollmentsService.createEnrollment(_enrollment);

    this._enrolledToCourse = true;
    this._enrollingCourse = false;
    notifyListeners();
  }
}