import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeachViewModel extends BaseViewModel {

  //service injection
  final NavigationService _navigationService = locator<NavigationService>();

  List<Course> createdCourses = [Course(title: "Curso1", description: "una larga description del curso 1", modules: []),
                                 Course(title: "Curso2", description: "una larga description del curso 2", modules: []),
                                 Course(title: "Curso3", description: "una larga description del curso 3", modules: []),
                                 Course(title: "Curso4", description: "una larga description del curso 4", modules: [])];


  onCreate() async {
     await _navigationService.navigateTo(Routes.createCourseView);
  }
}