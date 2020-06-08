import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/school/school_view_model.dart';
import 'package:stacked/stacked.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SchoolViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("SchoolView"),
          ),
        );
      },
      viewModelBuilder: () => SchoolViewModel(),
    );
  }
}
