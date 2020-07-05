import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

import 'course_on_list_view_model.dart';

class CourseOnListView extends StatelessWidget {
  const CourseOnListView({Key key, @required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<CourseOnListViewModel>.nonReactive(
      builder: (context, model, child) {
        final textTheme = Theme.of(context).textTheme;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: InkWell(
            onTap: () => model.onViewCourse(this.course),
            child: Container(
              height: 100,
              child: Stack(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: size.width / 3.0,
                        child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
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
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: size.width / 3.0),
                    width: size.width,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: Text(this.course.title,
                                  style: textTheme.bodyText1, overflow: TextOverflow.fade, softWrap: false),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text(this.course.description,
                              style: TextStyle(color: Colors.grey), overflow: TextOverflow.fade),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => CourseOnListViewModel(),
    );
  }
}
