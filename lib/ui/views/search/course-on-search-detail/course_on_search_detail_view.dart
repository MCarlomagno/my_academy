import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';
import 'course_on_search_detail_view_model.dart';

class CourseOnSearchDetailView extends StatelessWidget {
  const CourseOnSearchDetailView({Key key, @required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return ViewModelBuilder<CourseOnSearchDetailViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(this.course.id),
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(course.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          ),
                        ),
                      ),
                      imageUrl: this.course.thumbnailImage,
                      placeholder: (context, url) {
                        return Column(
                          children: <Widget>[
                            Spacer(),
                            SizedBox(
                              height: 1.0,
                              child: LinearProgressIndicator(),
                            )
                          ],
                        );
                      },
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
              ];
            },
            body: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        localeValues['description'],
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white70,
                      ),
                      margin: EdgeInsets.all(15),
                      height: 100,
                      child: Text(course.description),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        localeValues['modules'],
                        style: theme.textTheme.headline6,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white70,
                      ),
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      height: 150,
                      child: model.isBusy
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.modules.length,
                              itemBuilder: (context, index) {
                                var module = model.modules[index];
                                return Card(child: Text(module.title));
                              },
                            ),
                    ),
                  ],
                ),
                !model.enrolledToCourse
                    ? Positioned(
                        bottom: 0,
                        width: size.width,
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            color: theme.primaryColor,
                            onPressed: () => model.enrollCourse(course.id),
                            child: model.enrollingCourse
                                ? SizedBox( height: 25, width: 25 ,child: CircularProgressIndicator(strokeWidth: 3.0,),)
                                : Text(
                                    localeValues['enroll'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CourseOnSearchDetailViewModel(),
    );
  }
}
