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
        var theme = Theme.of(context);
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(module.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                  ),
                ),
              ];
            },
            body: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Descripción',
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white70,
                      ),
                      margin: EdgeInsets.all(15),
                      height: 100,
                      child: Text(module.description),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Clases',
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: model.isBusy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              // This next line does the trick.
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
                  ],
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
