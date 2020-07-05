import 'package:flutter/material.dart';

class Enrollment {
  int id;
  int userId;
  int courseId;
  Enrollment({this.id, @required this.userId, @required this.courseId});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "userId": this.userId,
      "courseId": this.courseId
    };
  }

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      id: json['id'] as int,
      userId: json['userId'] as int,
      courseId: json['courseId'] as int
    );
  }
}