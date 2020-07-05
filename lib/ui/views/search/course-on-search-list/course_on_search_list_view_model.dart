import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseOnSearchListViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  onViewCourse(Course course) {
    CourseOnDetailViewArguments args = CourseOnDetailViewArguments(course: course);
    _navigationService.navigateTo(Routes.courseOnSearchDetailView,arguments: args);
  }
}