import 'package:flutter/material.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';
import 'module_on_list_view_model.dart';

class ModuleOnListView extends StatelessWidget {
  const ModuleOnListView({Key key, @required this.module}) : super(key: key);
  final Module module;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ModuleOnListViewModel>.nonReactive(
      builder: (context, model, child) {
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Container(
            margin: EdgeInsets.all(15.0),
            height: 300,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(module.title,
                          style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.fade, softWrap: false),
                    ),
                    SizedBox(
                      width: 30,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Borrar módulo",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(module.description),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: module.classes.length,
                    itemBuilder: (context, index) {
                      var currentClass = module.classes[index];
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
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () => model.openModuleDetail(key, module),
                  child: Text('Ver'),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ModuleOnListViewModel(),
    );
  }
}
