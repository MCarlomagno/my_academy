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

abstract class Routes {
  static const homeViewRoute = '/home-view-route';
  static const createCourseView = '/create-course-view';
  static const createCourseDetailView = '/create-course-detail-view';
  static const all = {
    homeViewRoute,
    createCourseView,
    createCourseDetailView,
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
        if (hasInvalidArgs<CreateCourseDetailViewArguments>(args)) {
          return misTypedArgsRoute<CreateCourseDetailViewArguments>(args);
        }
        final typedArgs = args as CreateCourseDetailViewArguments ??
            CreateCourseDetailViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateCourseDetailView(key: typedArgs.key),
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
  CreateCourseDetailViewArguments({this.key});
}
