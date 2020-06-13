import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

import 'config/transition.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: _createTransition(),
            TargetPlatform.android: _createTransition(),
          },
        ),
        brightness: Brightness.dark,
        primaryColor: Color(0xFF212121),
        accentColor: Color(0xFF00bfa5),
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            ),
      ),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color(0xFF212121),
        accentColor: Color(0xFF00bfa5),
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            ),
      ),
      initialRoute: Routes.homeViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

PageTransitionsBuilder _createTransition() {
  return MyPageTransitionBuilder();
}
