import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:my_academy/ui/views/profile/profile_view.dart';
import 'package:my_academy/ui/views/school/school_view.dart';
import 'package:my_academy/ui/views/search/search_view.dart';
import 'package:my_academy/ui/views/teach/teach_view.dart';
import 'package:stacked/stacked.dart';


class HomeViewModel extends BaseViewModel {

  /// service injection
  UsersService _userService = locator<UsersService>();

  ///
  ///0 : [SearchView]: To browse courses across all the platform
  ///1 : [SchoolView]: To see actual courses.
  ///2 : [TeachView]: To start creating courses or see current courses created.
  ///3 : [StatisticsView]: To see courses finished, billings, etc
  ///4 : [ProfileView]: User profile
  ///
  final List<Widget> _children = [SearchView(),SchoolView(), TeachView(), ProfileView()];
  List<Widget> get children => _children;

  int _currentIndex = 0;
  int get currentIndex => this._currentIndex;



  onModelReady() async {
    setBusy(true);
    await _userService.loadUser();
    setBusy(false);
  }

  void onTap(int index) {
    this._currentIndex = index;
    notifyListeners();
  }

}