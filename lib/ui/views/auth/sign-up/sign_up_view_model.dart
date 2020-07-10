import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/user_model.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {

  UsersService _usersService = locator<UsersService>();
  NavigationService _navigationService = locator<NavigationService>();

  // Login controllers

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => this._emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => this._passwordController;

  // Sign Up controllers

  TextEditingController _emailSignUpController = TextEditingController();
  TextEditingController get emailSignUpController => this._emailSignUpController;

  TextEditingController _passwordSignUpController = TextEditingController();
  TextEditingController get passwordSignUpController => this._passwordSignUpController;

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => this._nameController;

  TextEditingController _surnameController = TextEditingController();
  TextEditingController get surnameController => this._surnameController;

  bool _loading = false;
  bool get loading => this._loading;

  bool _hasErrors = false;
  bool get hasErrors => this._hasErrors;

  String _errorMessage = "";
  String get errorMessage => this._errorMessage;

  Future<void> signIn() async {
    this._loading = true;
    this._hasErrors = false;
    notifyListeners();
    try {
      print(this._emailController.text);
      User user = await _usersService.login(this._emailController.text, this._passwordController.text);
      _navigationService.navigateTo(Routes.homeViewRoute);
    } catch (e) {
      if(e is PlatformException) {
        this._errorMessage = e.message;
      } else {
        this._errorMessage = 'Error inesperado';
      }
      this._hasErrors = true;
    } finally {
      this._loading = false;
      notifyListeners();
    }
  }

    Future<void> signUp() async {
    this._loading = true;
    this._hasErrors = false;
    notifyListeners();
    try {
      var user = User(email: emailSignUpController.text, name: nameController.text, surname: surnameController.text, password: passwordSignUpController.text);
      User userResult = await _usersService.signUp(user);
      _navigationService.navigateTo(Routes.homeViewRoute);
    } catch (e) {
      if(e is PlatformException) {
        this._errorMessage = e.message;
      } else {
        this._errorMessage = 'Error inesperado';
      }
      this._hasErrors = true;
    } finally {
      this._loading = false;
      notifyListeners();
    }
  }
}
