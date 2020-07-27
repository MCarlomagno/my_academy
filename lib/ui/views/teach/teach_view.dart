import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/ui/views/teach/teach_view_model.dart';
import 'package:stacked/stacked.dart';

import 'created-courses-list/created-course-on-list/created_course_on_list_view.dart';

class TeachView extends StatelessWidget {
  const TeachView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<TeachViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        if (model.isLoggedIn) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localeValues['created_courses']),
            ),
            body: RefreshIndicator(
                onRefresh: () => model.reload(),
                child: !model.isBusy
                    ? ListView.builder(
                        // Let the ListView know how many items it needs to build.
                        itemCount: model.createdCourses.length,
                        // Provide a builder function. This is where the magic happens.
                        // Convert each item into a widget based on the type of item it is.
                        itemBuilder: (context, index) {
                          final item = model.createdCourses[index];
                          return CreatedCourseOnListView(course: item);
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
            floatingActionButton: FloatingActionButton.extended(
              isExtended: true,
              onPressed: model.onCreate,
              label: Text(localeValues['create']),
              icon: Icon(Icons.add),
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  localeValues['teach_not_logged'],
                  style: theme.textTheme.headline4,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(left:15, right:15),
                child: Image(image: AssetImage('assets/teach_not_logged.png')),
              ),
              
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: theme.primaryColor,
                  shape: StadiumBorder(),
                  onPressed: () => model.navigateToSignUp(),
                  child: Text(
                    localeValues['teach'],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        }
      },
      viewModelBuilder: () => TeachViewModel(),
    );
  }
}
