import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/school/school_view_model.dart';
import 'package:stacked/stacked.dart';

import 'course-on-list/course_on_list_view.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SchoolViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
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
      },
      viewModelBuilder: () => SchoolViewModel(),
    );
  }
}
