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
      viewModelBuilder: () => CreateModuleViewModel(),
    );
  }
}
