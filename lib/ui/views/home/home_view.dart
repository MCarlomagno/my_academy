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
          body: IndexedStack(
              index: model.currentIndex,
              children: model.children,
            ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: model.onTap, 
            currentIndex: model.currentIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Buscar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('Escuela'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.extension),
                title: Text('Crear'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text('Estadisticas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Perfil'),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
