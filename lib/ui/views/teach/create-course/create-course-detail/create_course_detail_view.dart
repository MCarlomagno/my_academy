import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_course_detail_view_model.dart';
import 'modules-list/modules_list_view.dart';

class CreateCourseDetailView extends StatelessWidget {
  const CreateCourseDetailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseDetailViewModel>.nonReactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Módulos de tu curso'),
          ),
          body: model.modules.length > 0
              ? ModulesListView(modules: model.modules,)
              : Center(
                  child: RaisedButton(
                    child: Text(
                      'Crear nuevo módulo',
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () => null,
                  ),
                ),
        );
      },
      viewModelBuilder: () => CreateCourseDetailViewModel(),
    );
  }
}
