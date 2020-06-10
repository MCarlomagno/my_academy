import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/shared/video_player_widget.dart';
import 'package:stacked/stacked.dart';

import 'class_edit_view_model.dart';

class ClassEditView extends StatelessWidget {
  const ClassEditView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClassEditViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar clase'),
            actions: <Widget>[
              IconButton(
                onPressed: () => model.onConfirm(),
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: VideoPlayerScreen(),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Nombre de la clase"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    minLines: 4,
                    maxLines: 5,
                    decoration: InputDecoration(labelText: "Descripción de la clase"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ClassEditViewModel(),
    );
  }
}


