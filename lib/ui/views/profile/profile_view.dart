import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/profile/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("Profile"),
          ),
        );
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
