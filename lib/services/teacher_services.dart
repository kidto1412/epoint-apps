part of 'services.dart';

class TeacherServices {
  static Future<ApiReturnValue<Teacher>> SignIn(String nip, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'login-teacher';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{'nip': nip, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Teacher.token = data['data']['access_token'];
    Teacher value = Teacher.fromJson(data['data']['teacher']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Teacher>> SignUp(
      Teacher teacher, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register-teacher';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': teacher.name,
          'nip': teacher.nip,
          'password': teacher.nip,
          'address': teacher.address,
          'position': teacher.position,
          'gender': teacher.gender,
          'phoneNmber': teacher.phoneNumber,
          'date_and_place_of_birth': teacher.date_and_place_of_birth
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Teacher.token = data['data']['access_token'];
    Teacher value = Teacher.fromJson(data['data']['teacher']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Student>>> getStudents(
      {http.Client client}) async {
    client ??= client = http.Client();
    String url = baseUrl + 'students';
    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      List<Student> students = (data['data']['data'] as Iterable)
          .map((e) => Student.fromJsonList(e))
          .toList();
      print('students');
      print(students);
      return ApiReturnValue(value: students);
    }
  }
}
