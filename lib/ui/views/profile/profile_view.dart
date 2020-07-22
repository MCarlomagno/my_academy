import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/ui/views/profile/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        if (model.isLoggedIn) {
          return !model.isBusy
              ? SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: (size.width - 190.0) / 2),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 190.0,
                                height: 190.0,
                                child: CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  imageUrl: model.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            model.name,
                            style: textTheme.headline4,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            model.email,
                            style: textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Text(AppLocalizations.of(context).values['title'],),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        } else {
           return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Unirte te da la oportunidad de compartir lo que sabes",
                  style: theme.textTheme.headline4,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(left:15, right:15),
                child: Image(image: AssetImage('assets/profile_not_logged.png')),
              ),
              
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  color: theme.primaryColor,
                  shape: StadiumBorder(),
                  onPressed: () => model.navigateToSignUp(),
                  child: Text(
                    "Registrarse",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        }
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
