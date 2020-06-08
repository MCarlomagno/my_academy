import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/profile/profile_view_model.dart';
import 'package:my_academy/ui/views/statistics/statistics_view_model.dart';
import 'package:stacked/stacked.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("StatisticsView"),
          ),
        );
      },
      viewModelBuilder: () => StatisticsViewModel(),
    );
  }
}
