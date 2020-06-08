import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/teach/teach_view_model.dart';
import 'package:stacked/stacked.dart';

class TeachView extends StatelessWidget {
  const TeachView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeachViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("TeachView"),
          ),
        );
      },
      viewModelBuilder: () => TeachViewModel(),
    );
  }
}
