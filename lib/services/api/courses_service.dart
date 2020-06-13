import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/sample_database.dart';

class CoursesService {
  SampleDataBase _sampleDataBase = locator<SampleDataBase>();

  Future<List<Course>> getAllCourses() async {
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.getAllCourses();
  }

  Future<List<Course>> getUserCreatedCourses() async {
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.getUserCreatedCourses();
  }

  Future<Course> createCourse(Course newCourse) async {
    await Future.delayed(Duration(seconds: 3));
    return _sampleDataBase.createCourse(newCourse);
  }
}
