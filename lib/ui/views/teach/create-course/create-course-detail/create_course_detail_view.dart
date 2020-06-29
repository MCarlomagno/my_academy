import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_course_detail_view_model.dart';
import 'modules-list/modules_list_view.dart';

class CreateCourseDetailView extends StatelessWidget {
  const CreateCourseDetailView({Key key, @required this.courseId}) : super(key: key);
  final int courseId;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseDetailViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(this.courseId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Módulos de tu curso'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => model.onBackButtonPressed(),
            ),
          ),
          body: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : Container(child: ModulesListView(modules: model.modules)),
          floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            onPressed: model.createModule,
            label: Text("Crear módulo"),
            icon: Icon(Icons.add),
          ),
        );
      },
      viewModelBuilder: () => CreateCourseDetailViewModel(),
    );
  }
}
