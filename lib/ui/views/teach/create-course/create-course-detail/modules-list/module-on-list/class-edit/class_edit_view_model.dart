import 'package:my_academy/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassEditViewModel extends BaseViewModel {

  //service injection
  NavigationService _navigationService = locator<NavigationService>();

  onConfirm() {
    _navigationService.back();
  }
}