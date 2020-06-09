import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_course_view_model.dart';

class CreateCourseView extends StatelessWidget {
  const CreateCourseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateCourseViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear curso'),
          ),
          body: model.modules.length > 0
              ? ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: model.modules.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = model.modules[index];
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
                              children: <Widget>[
                                Flexible(
                                  child: Text(item.title,
                                      style: Theme.of(context).textTheme.headline5,
                                      overflow: TextOverflow.fade,
                                      softWrap: false),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 30,
                                  child: PopupMenuButton(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                          value: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.delete, color: Colors.redAccent,),
                                              SizedBox(width: 5,),
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
                            Text(item.description),
                            Spacer(),
                            RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {},
                              child: Text('Ver'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: RaisedButton(
                    child: Text(
                      'Crear nuevo módulo',
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () => null,
                  ),
                ),
        );
      },
      viewModelBuilder: () => CreateCourseViewModel(),
    );
  }
}
