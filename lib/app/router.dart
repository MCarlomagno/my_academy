import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_academy/ui/views/home/home_view.dart';
import 'package:my_academy/ui/views/shared/video_camera/video_camera_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/create_course_detail_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/modules-list/module-on-list/class-edit/class_edit_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create_course_view.dart';

@MaterialAutoRouter()
class $Router {
  HomeView homeViewRoute;
  CreateCourseView createCourseView;
  CreateCourseDetailView createCourseDetailView;
  ClassEditView classEditView;
  VideoCameraView videoCameraView;
}