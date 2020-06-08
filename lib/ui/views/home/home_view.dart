import 'package:flutter/material.dart'; 
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        var _scaffoldKey = GlobalKey<ScaffoldState>();
        return Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(model.data),
                ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
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
