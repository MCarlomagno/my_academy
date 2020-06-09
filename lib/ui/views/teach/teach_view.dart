import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/teach/teach_view_model.dart';
import 'package:stacked/stacked.dart';

class TeachView extends StatelessWidget {
  const TeachView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeachViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text('No hay cursos creados')],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            onPressed: model.onCreate,
            label: Text("Crear curso"),
            icon: Icon(Icons.add),
          ),
        );
      },
      viewModelBuilder: () => TeachViewModel(),
    );
  }
}
