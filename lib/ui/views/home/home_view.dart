import 'package:flutter/material.dart'; 
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.currentChild,
          bottomNavigationBar: BottomNavigationBar(
            onTap: model.onTap, 
            currentIndex: model.currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.extension),
                title: Text('Teach'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text('Statistics'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
