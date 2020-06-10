
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ModuleOnListViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  openClassDetail() async {
    await _navigationService.navigateTo(Routes.classEditView);
  }
}