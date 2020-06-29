import 'package:flutter/material.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

import 'created-course-on-list/created_course_on_list_view.dart';
import 'created_courses_list_view_model.dart';

class CreatedCoursesListView extends StatelessWidget {
  const CreatedCoursesListView({Key key, @required this.courses}) : super(key: key);
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatedCoursesListViewModel>.nonReactive(
            builder: (context, model, child) {
        return ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: this.courses.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = this.courses[index];
                    return CreatedCourseOnListView(course: item);
                  },
                );
      },
      viewModelBuilder: () => CreatedCoursesListViewModel(),
    );
  }
}
