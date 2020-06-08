import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/statistics/statistics_view_model.dart';
import 'package:stacked/stacked.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatisticsViewModel>.nonReactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Total user courses: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  model.totalUserCourses.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => StatisticsViewModel(),
    );
  }
}
