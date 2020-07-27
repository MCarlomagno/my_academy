import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
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
        var localeValues = AppLocalizations.of(context).values;
        return Scaffold(
          appBar: AppBar(
            title: Text(module.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Description title
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Text(
                    localeValues['description'],
                    style: theme.textTheme.headline6,
                  ),
                ),

                // Description
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white70,
                  ),
                  margin: EdgeInsets.all(15),
                  height: 100,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(module.description),
                  ),
                ),

                // Classes title
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    localeValues['classes'],
                    style: theme.textTheme.headline6,
                  ),
                ),

                // Classes list
                !model.isBusy
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          // This next line does the trick.
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.classes.length,
                          itemBuilder: (context, index) {
                            var currentClass = model.classes[index];

                            return InkWell(
                              onTap: () => model.onClassSelected(currentClass),
                              child: Container(
                                height: 138,
                                padding: EdgeInsets.all(15),
                                child: Card(
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            child: CachedNetworkImage(
                                              imageUrl: currentClass.thumbnailImage,
                                              imageBuilder: (context, imageProvider) => Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter: ColorFilter.mode(
                                                        Colors.black.withOpacity(0.8), BlendMode.dstATop),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              currentClass.title,
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Container(
                                              width: 200,
                                              child: Text(
                                                currentClass.description,
                                                overflow: TextOverflow.fade,
                                                maxLines: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
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
                  Text(localeValues['create_class']),
                ],
              )),
        );
      },
      viewModelBuilder: () => ModuleDetailViewModel(),
    );
  }
}
