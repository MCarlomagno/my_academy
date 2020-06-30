import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreatedCourseOnListViewModel extends BaseViewModel {
  //service injection
  final NavigationService _navigationService = locator<NavigationService>();

  onViewCourse(int courseId) async {
    var args = CreateCourseDetailViewArguments(courseId: courseId);
    await _navigationService.navigateTo(Routes.createCourseDetailView, arguments: args);
  }
}