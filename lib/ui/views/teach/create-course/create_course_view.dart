import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:stacked/stacked.dart';
import 'create_course_view_model.dart';

class CreateCourseView extends StatelessWidget {
  const CreateCourseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseViewModel>.reactive(
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        return Scaffold(
          appBar: AppBar(
            title: Text(localeValues['create']),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => model.onCancel(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => model.onConfirm(),
              )
            ],
          ),
          body: !model.isBusy
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: model.titleController,
                        decoration: InputDecoration(
                          labelText: localeValues['title'],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: model.descriptionController,
                        minLines: 5,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: localeValues['description'],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
      disposeViewModel: true,
      viewModelBuilder: () => CreateCourseViewModel(),
    );
  }
}
