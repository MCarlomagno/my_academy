import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/auth/sign-up/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      builder: (context, model, child) {
        return DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Ingresar'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.exit_to_app),
                    text: "Iniciar Sesión",
                  ),
                  Tab(
                    icon: Icon(Icons.person_add),
                    text: "Registrarse",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _signInView(context),
                _signUpView(context),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpViewModel(),
    );
  }

  Widget _signInView(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(labelText: "Contraseña", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 100),
            width: 300,
            height: 50,
            child: RaisedButton(
              shape: StadiumBorder(),
              color: theme.primaryColor,
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpView(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(labelText: "Contraseña", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 100),
            width: 300,
            height: 50,
            child: RaisedButton(
              shape: StadiumBorder(),
              color: theme.primaryColor,
              child: Text(
                "Registrarme",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => null,
            ),
          ),
        ],
      ),
    );
  }
}
