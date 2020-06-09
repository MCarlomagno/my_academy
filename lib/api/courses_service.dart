import 'package:my_academy/models/course_model.dart';

class CoursesService {

  //Sample data
  List<Course> allCoursesSampleData = [Course(title: 'Sample title1', description: 'Sample description1', modules: []),
                                      Course(title: 'Sample title2', description: 'Sample description2', modules: []),
                                      Course(title: 'Sample title3', description: 'Sample description3', modules: []),
                                      Course(title: 'Sample title4', description: 'Sample description4', modules: []),
                                      Course(title: 'Sample title5', description: 'Sample description5', modules: []),
                                      Course(title: 'Sample title6', description: 'Sample description6', modules: []),
                                      Course(title: 'Sample title7', description: 'Sample description7', modules: []),
                                      Course(title: 'Sample title8', description: 'Sample description8', modules: []),
                                      Course(title: 'Sample title9', description: 'Sample description9', modules: []),
                                      Course(title: 'Sample title10', description: 'Sample description10', modules: []),
                                      Course(title: 'Sample title6', description: 'Sample description6', modules: []),
                                      Course(title: 'Sample title7', description: 'Sample description7', modules: []),
                                      Course(title: 'Sample title8', description: 'Sample description8', modules: []),
                                      Course(title: 'Sample title9', description: 'Sample description9', modules: []),
                                      Course(title: 'Sample title10', description: 'Sample description10', modules: [])];
  List<Course> userCourses = [Course(title: 'Sample title3', description: 'Sample description3', modules: []),
                              Course(title: 'Sample title10', description: 'Sample description10', modules: []),
                              Course(title: 'Sample title7', description: 'Sample description7',modules: [])];
  int totalUserCourses = 3;

  List<Course> getAllCourses() {
    return allCoursesSampleData;
  }

  List<Course> getUserCourses() {
    return userCourses;
  }

  int getTotalUserCourses() {
    return totalUserCourses;
  }

  addCourse(Course course) {
    print('added couse: title: '+ course.title + ', description: ' + course.description);
    allCoursesSampleData.add(course);
  }
}