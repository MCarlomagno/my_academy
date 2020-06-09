import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_course_view_model.dart';

class CreateCourseView extends StatelessWidget {
  const CreateCourseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear curso'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => model.onConfirm(),
              )
            ],
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Ingresa un título',
                        ),
                      ),
                      TextField(
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
            ),
          ),
        );
      },
      viewModelBuilder: () => CreateCourseViewModel(),
    );
  }
}
