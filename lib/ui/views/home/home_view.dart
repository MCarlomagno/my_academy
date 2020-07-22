import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        return !model.isBusy
            ? Scaffold(
                body: IndexedStack(
                  key: key,
                  index: model.currentIndex,
                  children: model.children,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  onTap: model.onTap,
                  currentIndex: model.currentIndex,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      title: Text(localeValues['search'],),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      title: Text(localeValues['school'],),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.extension),
                      title: Text(localeValues['create'],),
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.equalizer),
                    //   title: Text('Estadisticas'),
                    // ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text(localeValues['profile']),
                    ),
                  ],
                ),
              )
            : Scaffold(
              body: Container(
                color: Colors.white,
                child: Center(
                  child: Text("My Academy", style: TextStyle(fontFamily: "Roboto"),),
                ),
              ),
            );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
