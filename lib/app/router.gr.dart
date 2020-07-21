// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_academy/ui/views/home/home_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create_course_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/create_course_detail_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/modules-list/module-on-list/class-edit/class_edit_view.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/ui/views/shared/video_camera/video_camera_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/create-module/create_module_view.dart';
import 'package:my_academy/ui/views/teach/create-course/create-course-detail/module-detail/module_detail_view.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/ui/views/shared/course-on-search-detail/course_on_search_detail_view.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/ui/views/auth/sign-up/sign_up_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const createCourseView = '/create-course-view';
  static const createCourseDetailView = '/create-course-detail-view';
  static const classEditView = '/class-edit-view';
  static const videoCameraView = '/video-camera-view';
  static const createModuleView = '/create-module-view';
  static const moduleDetailView = '/module-detail-view';
  static const courseOnSearchDetailView = '/course-on-search-detail-view';
  static const signUpView = '/sign-up-view';
  static const all = {
    homeViewRoute,
    createCourseView,
    createCourseDetailView,
    classEditView,
    videoCameraView,
    createModuleView,
    moduleDetailView,
    courseOnSearchDetailView,
    signUpView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.createCourseView:
        if (hasInvalidArgs<CreateCourseViewArguments>(args)) {
          return misTypedArgsRoute<CreateCourseViewArguments>(args);
        }
        final typedArgs =
            args as CreateCourseViewArguments ?? CreateCourseViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateCourseView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.createCourseDetailView:
        if (hasInvalidArgs<CreateCourseDetailViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreateCourseDetailViewArguments>(args);
        }
        final typedArgs = args as CreateCourseDetailViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateCourseDetailView(
              key: typedArgs.key, courseId: typedArgs.courseId),
          settings: settings,
        );
      case Routes.classEditView:
        if (hasInvalidArgs<ClassEditViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ClassEditViewArguments>(args);
        }
        final typedArgs = args as ClassEditViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ClassEditView(
              key: typedArgs.key,
              moduleId: typedArgs.moduleId,
              classToEdit: typedArgs.classToEdit),
          settings: settings,
        );
      case Routes.videoCameraView:
        if (hasInvalidArgs<VideoCameraViewArguments>(args)) {
          return misTypedArgsRoute<VideoCameraViewArguments>(args);
        }
        final typedArgs =
            args as VideoCameraViewArguments ?? VideoCameraViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => VideoCameraView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.createModuleView:
        if (hasInvalidArgs<CreateModuleViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<CreateModuleViewArguments>(args);
        }
        final typedArgs = args as CreateModuleViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateModuleView(
              key: typedArgs.key, courseId: typedArgs.courseId),
          settings: settings,
        );
      case Routes.moduleDetailView:
        if (hasInvalidArgs<ModuleDetailViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ModuleDetailViewArguments>(args);
        }
        final typedArgs = args as ModuleDetailViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ModuleDetailView(key: typedArgs.key, module: typedArgs.module),
          settings: settings,
        );
      case Routes.courseOnSearchDetailView:
        if (hasInvalidArgs<CourseOnDetailViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CourseOnDetailViewArguments>(args);
        }
        final typedArgs = args as CourseOnDetailViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              CourseOnDetailView(key: typedArgs.key, course: typedArgs.course),
          settings: settings,
        );
      case Routes.signUpView:
        if (hasInvalidArgs<SignUpViewArguments>(args)) {
          return misTypedArgsRoute<SignUpViewArguments>(args);
        }
        final typedArgs = args as SignUpViewArguments ?? SignUpViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

//CreateCourseView arguments holder class
class CreateCourseViewArguments {
  final Key key;
  CreateCourseViewArguments({this.key});
}

//CreateCourseDetailView arguments holder class
class CreateCourseDetailViewArguments {
  final Key key;
  final int courseId;
  CreateCourseDetailViewArguments({this.key, @required this.courseId});
}

//ClassEditView arguments holder class
class ClassEditViewArguments {
  final Key key;
  final int moduleId;
  final Class classToEdit;
  ClassEditViewArguments({this.key, @required this.moduleId, this.classToEdit});
}

//VideoCameraView arguments holder class
class VideoCameraViewArguments {
  final Key key;
  VideoCameraViewArguments({this.key});
}

//CreateModuleView arguments holder class
class CreateModuleViewArguments {
  final Key key;
  final int courseId;
  CreateModuleViewArguments({this.key, @required this.courseId});
}

//ModuleDetailView arguments holder class
class ModuleDetailViewArguments {
  final Key key;
  final Module module;
  ModuleDetailViewArguments({this.key, @required this.module});
}

//CourseOnDetailView arguments holder class
class CourseOnDetailViewArguments {
  final Key key;
  final Course course;
  CourseOnDetailViewArguments({this.key, @required this.course});
}

//SignUpView arguments holder class
class SignUpViewArguments {
  final Key key;
  SignUpViewArguments({this.key});
}
