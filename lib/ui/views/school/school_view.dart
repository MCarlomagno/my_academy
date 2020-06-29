import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/school/school_view_model.dart';
import 'package:stacked/stacked.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SchoolViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Mis Cursos'),
          ),
          body: Center(
              child: model.isBusy
                  ? CircularProgressIndicator()
                  : RefreshIndicator(
                      child: ListView.builder(
                    itemCount: model.myCourses.length,
                    itemBuilder: (context, index) {
                      var item = model.myCourses[index];
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
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(item.description),
                              ),
                              Container(
                                height: 150,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListView.builder(
                                  // This next line does the trick.
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.modules.length,
                                  itemBuilder: (context, index) {
                                    var currentClass = item.modules[index];
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
                                onPressed: () => null,
                                child: Text('Ver'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                      onRefresh: () => model.reload())),
        );
      },
      viewModelBuilder: () => SchoolViewModel(),
    );
  }
}
