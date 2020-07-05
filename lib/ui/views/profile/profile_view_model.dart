import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/user_model.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  UsersService _usersService = locator<UsersService>();

  String get photoUrl => this._user.imageUrl;

  String get name => this._user.name + ' ' + this._user.surname;

  String get email => this._user.email;

  bool get isLoggedIn => _usersService.isLoggedIn;

  User _user; 

  onModelReady() async {
    setBusy(true);
    this._user = await _usersService.getUserById(_usersService.currentUserId);
    setBusy(false);
  }

}