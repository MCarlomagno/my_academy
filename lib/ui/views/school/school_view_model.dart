import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SchoolViewModel extends BaseViewModel {
  UsersService _usersService = locator<UsersService>();
  NavigationService _navigationService = locator<NavigationService>();

  List<Course> _myCourses = [];
  List<Course> get myCourses => this._myCourses;

  bool get isLoggedIn => _usersService.isLoggedIn;
  
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

  
  navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }


}