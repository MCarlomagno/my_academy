import 'package:flutter/material.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

import 'created_course_on_list_view_model.dart';

class CreatedCourseOnListView extends StatelessWidget {
  const CreatedCourseOnListView({Key key, @required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatedCourseOnListViewModel>.nonReactive(
      builder: (context, model, child) {
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Container(
            margin: EdgeInsets.all(15.0),
            height: 300,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      child: Text(this.course.title,
                          style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.fade, softWrap: false),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(this.course.description),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: this.course.modules.length,
                    itemBuilder: (context, index) {
                      var currentClass = this.course.modules[index];
                      return Container(
                          width: 160.0,
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Text(currentClass.title),
                                Text(currentClass.description),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () => model.onViewCourse(),
                  child: Text('Ver'),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CreatedCourseOnListViewModel(),
    );
  }
}
