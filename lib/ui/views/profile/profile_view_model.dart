import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/user_model.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  UsersService _usersService = locator<UsersService>();
  NavigationService _navigationService = locator<NavigationService>();

  String get photoUrl => this._user.imageUrl ?? "https://res.cloudinary.com/dzvvvii9u/image/upload/v1595374514/images_z5wxoc.png";

  String get name => this._user.name + ' ' + this._user.surname;

  String get email => this._user.email;

  bool get isLoggedIn => _usersService.isLoggedIn;

  User _user; 

  onModelReady() {
    this._user = _usersService.user;
  }

  
  navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }


}