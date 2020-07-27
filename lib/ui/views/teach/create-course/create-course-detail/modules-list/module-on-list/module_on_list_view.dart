import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
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
        var localeValues = AppLocalizations.of(context).values;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Container(
            margin: EdgeInsets.all(20.0),
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  localeValues['delete_module'],
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(module.description, maxLines: 2,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      elevation: 0,
                      onPressed: () => model.openModuleDetail(key, module),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
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
