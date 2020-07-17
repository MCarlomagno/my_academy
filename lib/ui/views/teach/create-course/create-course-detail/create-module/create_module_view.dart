import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_module_view_model.dart';

class CreateModuleView extends StatelessWidget {
  const CreateModuleView({Key key, @required this.courseId}) : super(key: key);
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateModuleViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(this.courseId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear modulo'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.check,
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
                          labelText: "Título",
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
                          labelText: "Descripción",
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
      viewModelBuilder: () => CreateModuleViewModel(),
    );
  }
}
