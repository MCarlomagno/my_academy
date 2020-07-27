import 'package:flutter/material.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';
import 'module-on-list/module_on_list_view.dart';
import 'modules_list_view_model.dart';

class ModulesListView extends StatelessWidget {
  const ModulesListView({Key key, @required this.modules, @required this.fromOwner}) : super(key: key);
  final List<Module> modules;
  final bool fromOwner;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ModulesListViewModel>.nonReactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: this.modules.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = this.modules[index];
            return ModuleOnListView(module: item, fromOwner: fromOwner,);
          },
        );
      },
      viewModelBuilder: () => ModulesListViewModel(),
    );
  }
}
