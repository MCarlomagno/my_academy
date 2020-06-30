import 'dart:convert';

import 'package:my_academy/app/locator.dart';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/sample_database.dart';
import 'package:http/http.dart' as http;

class CoursesService {
  String url = Enviroment.apiUrl + "/courses";
  SampleDataBase _sampleDataBase = locator<SampleDataBase>();

  Future<List<Course>> getAllCourses() async {
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.getAllCourses();
  }

  Future<List<Course>> getUserCreatedCourses() async {
    try {
      List<Course> courses = [];
      var getUserCoursesUrl = this.url + '/getUserCreatedCourses/' + _sampleDataBase.currentUserId.toString();
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.get(getUserCoursesUrl);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      var coursesJsonList = jsonDecode(response.body);
      for(var courseJson in coursesJsonList) {
        courses.add(Course.fromJson(courseJson));
      }
      return courses;
    }catch (e) {
      print(e);
      throw Exception('Ocurrio un error buscando cursos');
    }
  }

  Future<Course> createCourse(Course newCourse) async {
    try {
      String body = jsonEncode(newCourse.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url,body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
      return Course.fromJson(jsonDecode(response.body));
    }catch (e) {
      print(e);
      throw Exception('Ocurrio un error creando el curso');
    }
  }

  Future<void> pingServer() async {
  
    DateTime before = DateTime.now();
    DateTime after;
    var client = http.Client();
    try {
      var uriResponse = await client.get(this.url);
      after = DateTime.now();
      print("result: " + uriResponse.body.toString());
      print("milliseconds: " + (after.millisecondsSinceEpoch - before.millisecondsSinceEpoch).toString());
    } finally {
      client.close();
    }
  }
}