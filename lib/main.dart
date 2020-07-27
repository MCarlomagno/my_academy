import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/ui/views/intro/intro.dart';
import 'package:stacked_services/stacked_services.dart';

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
      // darkTheme: ThemeData(
      //   pageTransitionsTheme: PageTransitionsTheme(
      //     builders: <TargetPlatform, PageTransitionsBuilder>{
      //       TargetPlatform.iOS: _createTransition(),
      //       TargetPlatform.android: _createTransition(),
      //     },
      //   ),
      //   brightness: Brightness.dark,
      //   primaryColor: Color(0xFF142850),
      //   accentColor: Color(0xFF00909e),
      //   // Define the default TextTheme. Use this to specify the default
      //   // text styling for headlines, titles, bodies of text, and more.
      //   textTheme: TextTheme(
      //       //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //       //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //       ),
      // ),
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).values['title'],
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color(0xFF142850),
        accentColor: Color(0xFF00909e),
        canvasColor: Color(0xFFdae1e7),
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            ),
      ),
      //home: IntroScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

// PageTransitionsBuilder _createTransition() {
//   return MyPageTransitionBuilder();
// }
