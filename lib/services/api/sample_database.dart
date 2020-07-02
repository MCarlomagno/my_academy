import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/models/user_model.dart';

class SampleDataBase {
  int _currentUserId = 1;
  int get currentUserId => this._currentUserId;

  // In this sample database lets suppose there are 3 users in the app
  List<User> _users = [User(id: 1), User(id: 2), User(id: 3)];

  List<Course> _courses = [];
  int _lastCourseId = 0;

  List<Module> _modules = [];
  int _lastModuleId = 0;

  List<Class> _classes = [];
  int _lastClassId = 0;

  List<User> getAllUsers() {
    return _users;
  }

  /// START [Courses]
  List<Course> getAllCourses() {
    return _courses;
  }

  Course createCourse(Course newCourse) {
    this._lastCourseId++;
    newCourse.id = this._lastCourseId;
    newCourse.modules = [];
    newCourse.ownerUserId = currentUserId;
    this._courses.add(newCourse);
    return newCourse;
  }
  /// FINISH [Courses]


  /// START [Modules]
  
  List<Module> getModulesByCourseId(int courseId) {
    return this._modules.where((element) => element.courseId == courseId).toList();
  }

  Module createModule(Module newModule) {
    this._lastModuleId++;
    newModule.id = this._lastModuleId;
    newModule.classes = [];
    
    // adds the module to modules list
    this._modules.add(newModule);
    
    // adds the module to course
    Course course = this._courses.firstWhere((element) => element.id == newModule.courseId);
    course.modules.add(newModule);

    return newModule;
  }

  /// FINISH [Modules]


  /// START [Classes]
  List<Class> getClassesByModuleId(int moduleId) {
    return this._classes.where((element) => element.moduleId == moduleId).toList();
  }

  Class createClass(Class currentClass) {
    this._lastClassId++;
    currentClass.id = this._lastClassId;

    //adds the new class to classes list
    this._classes.add(currentClass);

    //adds the new class to the module
    Module module = _modules.firstWhere((element) => element.id == currentClass.moduleId);
    module.classes.add(currentClass);

    //adds the new class to the course
    Course course = _courses.firstWhere((element) => element.id == module.courseId);
    Module courseModule = course.modules.firstWhere((element) => element.id == module.id);
    courseModule.classes.add(currentClass);

    return currentClass;
  }




  /// FINISH [Classes]

}