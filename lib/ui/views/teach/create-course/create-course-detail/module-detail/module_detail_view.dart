import 'package:flutter/material.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';
import 'module_detail_view_model.dart';

class ModuleDetailView extends StatelessWidget {
  const ModuleDetailView({Key key, @required this.module}) : super(key: key);
  final Module module;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ModuleDetailViewModel>.reactive(
      onModelReady: (model) {
        model.onModelReady(module);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Detalle de modulo'),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text('Nombre:'),
                    subtitle: Text(
                      this.module.title,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: ListTile(
                    title: Text('Descripcion:'),
                    subtitle: Text(
                      this.module.description,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title: Text('Clases'),
                    subtitle: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: model.isBusy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              itemCount: model.classes.length,
                              itemBuilder: (context, index) {
                                var currentClass = model.classes[index];
                                return Container(
                                    width: 160.0,
                                    child: Card(
                                      child: Column(
                                        children: <Widget>[
                                          Text(currentClass.title),
                                          Text(currentClass.description),
                                        ],
                                      ),
                                    ));
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                model.createClass(key);
              },
              label: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('Crear clase'),
                ],
              )),
        );
      },
      viewModelBuilder: () => ModuleDetailViewModel(),
    );
  }
}
