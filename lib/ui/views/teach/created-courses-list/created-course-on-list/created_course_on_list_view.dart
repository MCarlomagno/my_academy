import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

import 'created_course_on_list_view_model.dart';

class CreatedCourseOnListView extends StatelessWidget {
  const CreatedCourseOnListView({Key key, @required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    List<Step> moduleSteps = [];

    return ViewModelBuilder<CreatedCourseOnListViewModel>.nonReactive(
      builder: (context, model, child) {
        final textTheme = Theme.of(context).textTheme;
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: InkWell(
            onTap: () => model.onViewCourse(course.id),
            child: Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: CachedNetworkImage(
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
                      Container(
                        height: 150,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton(
                              itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                                const PopupMenuItem<dynamic>(
                                  value: 1,
                                  child: Text('Borrar'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: Text(this.course.title,
                                  style: textTheme.headline5, overflow: TextOverflow.fade, softWrap: false),
                            ),
                          ],
                        ),
                        Text(
                          this.course.description,
                          style: TextStyle(color: Colors.grey),
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
      viewModelBuilder: () => CreatedCourseOnListViewModel(),
    );
  }
}
