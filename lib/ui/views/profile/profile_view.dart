import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/profile/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return ViewModelBuilder<ProfileViewModel>.nonReactive(
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: new DiagonalClipper(),
                    child: new DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: new BoxDecoration(color: theme.primaryColor),
                      child: Image.network("https://live.staticflickr.com/2912/13981352255_fc59cfdba2_b.jpg"),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Text(
              "Name and Surname",
              style: textTheme.headline6.copyWith(color: Colors.white),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: _buildLocationInfo(textTheme),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: new Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting '
                'industry. Lorem Ipsum has been the industry\'s standard dummy '
                'text ever since the 1500s.',
                style: textTheme.bodyText1.copyWith(color: Colors.white70, fontSize: 16.0),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: new Row(
                children: <Widget>[
                  _createCircleBadge(Icons.beach_access, theme.accentColor),
                  _createCircleBadge(Icons.cloud, Colors.white12),
                  _createCircleBadge(Icons.shop, Colors.white12),
                ],
              ),
            ),
          ],
        );
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

  Widget _createCircleBadge(IconData iconData, Color color) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: new CircleAvatar(
        backgroundColor: color,
        child: new Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }

  Widget _buildLocationInfo(TextTheme textTheme) {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            "Location",
            style: textTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
