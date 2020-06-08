import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  String _photoUrl = 'https://i.imgur.com/BoN9kdC.png';
  String get photoUrl => this._photoUrl;

  String _name = 'Marcos Carlomagno';
  String get name => this._name;

  String _email = 'marcoscarlomagno1@gmail.com';
  String get email => this._email;
}