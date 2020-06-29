
import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ModuleOnListViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  openModuleDetail(Key key,Module module) async {
    ModuleDetailViewArguments args = ModuleDetailViewArguments(module: module);
    await _navigationService.navigateTo(Routes.moduleDetailView,arguments: args);
  }
}