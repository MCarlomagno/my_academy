import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_academy/ui/views/auth/sign-up/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
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
                _signInView(context, model),
                _signUpView(context, model),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpViewModel(),
    );
  }

  Widget _signInView(BuildContext context, SignUpViewModel model) {
    var theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();
    return Container(
      margin: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email requerido';
                }
                return null;
              },
              controller: model.emailController,
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Contraseña requerida';
                }
                return null;
              },
              obscureText: true,
              controller: model.passwordController,
              decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            Spacer(),
            model.hasErrors ? Text(model.errorMessage): Container(),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 300,
              height: 50,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: theme.primaryColor,
                child: model.signingIn
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2,),
                      )
                    : Text(
                        "Iniciar Sesión",
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: !model.signingIn? () {
                  if (_formKey.currentState.validate()) {
                    model.signIn();
                  }
                }: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpView(BuildContext context, SignUpViewModel model) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
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
