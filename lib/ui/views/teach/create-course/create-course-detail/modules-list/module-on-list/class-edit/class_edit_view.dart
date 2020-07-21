import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/ui/views/shared/add_video/add_video_view.dart';
import 'package:stacked/stacked.dart';

import 'class_edit_view_model.dart';

class ClassEditView extends StatelessWidget {
  const ClassEditView({Key key, @required this.moduleId, this.classToEdit}) : super(key: key);
  final int moduleId;
  final Class classToEdit;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClassEditViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(moduleId, classToEdit),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar clase'),
            actions: <Widget>[
              Visibility(
                visible:this.classToEdit == null,
                child: IconButton(
                  onPressed: () => model.onConfirm(),
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          body: !model.isBusy
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      model.classToEdit != null ? AddVideoView(url: classToEdit.videoUrl) : AddVideoView(),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: model.titleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Título",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: model.descriptionController,
                          minLines: 4,
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
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
      viewModelBuilder: () => ClassEditViewModel(),
    );
  }
}
