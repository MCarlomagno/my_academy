import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/school/school_view_model.dart';
import 'package:stacked/stacked.dart';

import 'course-on-list/course_on_list_view.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<SchoolViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        if (model.isLoggedIn) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Mis Cursos'),
            ),
            body: Center(
                child: model.isBusy
                    ? CircularProgressIndicator()
                    : RefreshIndicator(
                        child: ListView.builder(
                          itemCount: model.myCourses.length,
                          itemBuilder: (context, index) {
                            var item = model.myCourses[index];
                            return CourseOnListView(
                              course: item,
                            );
                          },
                        ),
                        onRefresh: () => model.reload())),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Siempre hay una buena excusa para aprender algo nuevo.",
                  style: theme.textTheme.headline4,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(left:15, right:15),
                child: Image(image: AssetImage('assets/school_not_logged.png')),
              ),
              
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: theme.primaryColor,
                  shape: StadiumBorder(),
                  onPressed: () => null,
                  child: Text(
                    "Aprender",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        }
      },
      viewModelBuilder: () => SchoolViewModel(),
    );
  }
}
