import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/teach/created-courses-list/created_courses_list_view.dart';
import 'package:my_academy/ui/views/teach/teach_view_model.dart';
import 'package:stacked/stacked.dart';

class TeachView extends StatelessWidget {
  const TeachView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeachViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cursos creados'),
            leading: Container(),
            actions: <Widget>[
              PopupMenuButton(
                icon: Icon(Icons.settings),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Configuracion",
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Container(
            child: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CreatedCoursesListView(courses: model.createdCourses),
          ),
          floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            onPressed: model.onCreate,
            label: Text("Crear curso"),
            icon: Icon(Icons.add),
          ),
        );
      },
      viewModelBuilder: () => TeachViewModel(),
    );
  }
}
