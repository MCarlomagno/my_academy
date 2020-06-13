import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_course_view_model.dart';

class CreateCourseView extends StatelessWidget {
  const CreateCourseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear curso'),
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
          body: Center(
            child: !model.isBusy
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: model.titleController,
                              decoration: InputDecoration(
                                hintText: 'Ingresa un título',
                              ),
                            ),
                            TextField(
                              controller: model.descriptionController,
                              minLines: 5,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Ingresa una descripcion',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
      disposeViewModel: true,
      viewModelBuilder: () => CreateCourseViewModel(),
    );
  }
}
