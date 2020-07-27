import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/ui/views/auth/sign-up/sign_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        return DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset:false,
            appBar: AppBar(
              title: Text(localeValues['enter']),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.exit_to_app),
                    text: localeValues['sign_in'],
                  ),
                  Tab(
                    icon: Icon(Icons.person_add),
                    text: localeValues['sign_up'],
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
    var localeValues = AppLocalizations.of(context).values;
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
                  return localeValues['email_required'];
                }
                return null;
              },
              controller: model.emailController,
              decoration: InputDecoration(
                  labelText: localeValues['email'], border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return  localeValues['password_required'];
                }
                return null;
              },
              obscureText: true,
              controller: model.passwordController,
              decoration: InputDecoration(
                  labelText: localeValues['password'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            Spacer(),
            model.hasErrors ? Text(model.errorMessage) : Container(),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 300,
              height: 50,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: theme.primaryColor,
                child: model.loading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        localeValues['sign_in'],
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: !model.loading
                    ? () {
                        if (_formKey.currentState.validate()) {
                          model.signIn(context);
                        }
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpView(BuildContext context, SignUpViewModel model) {
    var theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();
    var localeValues = AppLocalizations.of(context).values;
    return Container(
      margin: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Email
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return localeValues['email_required'];
                }
                return null;
              },
              controller: model.emailSignUpController,
              decoration: InputDecoration(
                  labelText: localeValues['email'], border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 30,
            ),

            // Password

            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return localeValues['password_required'];
                }
                return null;
              },
              obscureText: true,
              controller: model.passwordSignUpController,
              decoration: InputDecoration(
                  labelText: localeValues['password'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 30,
            ),

            //

            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return localeValues['name_required'];
                }
                return null;
              },
              controller: model.nameController,
              decoration: InputDecoration(
                  labelText: localeValues['name'], border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return localeValues['surname_required'];
                }
                return null;
              },
              controller: model.surnameController,
              decoration: InputDecoration(
                  labelText: localeValues['surname'],
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            Spacer(),
            model.hasErrors ? Text(model.errorMessage) : Container(),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 300,
              height: 50,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: theme.primaryColor,
                child: model.loading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        localeValues['sign_up'],
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: !model.loading
                    ? () {
                        if (_formKey.currentState.validate()) {
                          model.signUp(context);
                        }
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
