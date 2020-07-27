import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
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
        var localeValues = AppLocalizations.of(context).values;
        return Scaffold(
          appBar: AppBar(
            title: Text(localeValues['course_modules']),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => model.onBackButtonPressed(),
            ),
          ),
          body: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : Container(child: ModulesListView(modules: model.modules, fromOwner: true,)),
          floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            onPressed: model.createModule,
            label: Text(localeValues['create_module']),
            icon: Icon(Icons.add),
          ),
        );
      },
      viewModelBuilder: () => CreateCourseDetailViewModel(),
    );
  }
}
