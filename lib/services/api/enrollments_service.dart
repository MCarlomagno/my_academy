import 'dart:convert';
import 'package:my_academy/env/enviroment.dart';
import 'package:my_academy/models/enrollment_model.dart';
import 'package:http/http.dart' as http;

class EnrollmentsService {
  String url = Enviroment.apiUrl + "/enrollments";

  Future<Enrollment> createEnrollment(Enrollment enrollment) async {
    try {
      String body = jsonEncode(enrollment.toJson());
      int beforeRequest = DateTime.now().millisecondsSinceEpoch;
      var response = await http.post(url, body: body);
      int latency = DateTime.now().millisecondsSinceEpoch - beforeRequest;
      print('latencia:' + latency.toString());
      print(response.body);
      return Enrollment.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw Exception('Ocurrio un error creando el enrollment');
    }
  }
}
