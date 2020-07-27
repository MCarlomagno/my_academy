import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/ui/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

//------------------ Custom your own tabs ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();
  bool loading = false;
  NavigationService navigationService = locator<NavigationService>();

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
    }
    setState(() {
      loading = false;
    });
  }

  Function goToTab;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });

  }

  void onDonePress() async {
    // Back to the first tab
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeView()));
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    var localeValues = AppLocalizations.of(context).values;
    slides = [
      Slide(
        title: localeValues['school'],
        styleTitle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: localeValues['school_not_logged'],
        styleDescription: TextStyle(
            color: Theme.of(context).accentColor, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "assets/profile_not_logged.png",
      ),
      Slide(
        title: localeValues['teach'],
        styleTitle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: localeValues['teach_not_logged'],
        styleDescription: TextStyle(
            color: Theme.of(context).accentColor, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "assets/school_not_logged.png",
      ),
      Slide(
        title: localeValues['community'],
        styleTitle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: localeValues['profile_not_logged'],
        styleDescription: TextStyle(
            color: Theme.of(context).accentColor, fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "assets/teach_not_logged.png",
      ),
    ];
    return loading
        ? IntroSlider(
            // List slides
            slides: this.slides,

            // Skip button
            renderSkipBtn: this.renderSkipBtn(),
            colorSkipBtn: Theme.of(context).primaryColor,
            highlightColorSkipBtn: Theme.of(context).accentColor,

            // Next button
            renderNextBtn: this.renderNextBtn(),

            // Done button
            renderDoneBtn: this.renderDoneBtn(),
            onDonePress: this.onDonePress,
            colorDoneBtn: Theme.of(context).primaryColor,
            highlightColorDoneBtn: Theme.of(context).accentColor,

            // Dot indicator
            colorDot: Theme.of(context).primaryColor,
            sizeDot: 13.0,
            typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

            // Tabs
            listCustomTabs: this.renderListCustomTabs(),
            backgroundColorAllSlides: Colors.white,
            refFuncGoToTab: (refFunc) {
              this.goToTab = refFunc;
            },

            // Show or hide status bar
            shouldHideStatusBar: true,

            // On tab change completed
            onTabChangeCompleted: this.onTabChangeCompleted,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
