part of 'services.dart';

class StudentServices {
  static Future<ApiReturnValue<Student>> SignIn(String nis, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'login-student';
    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{'nis': nis, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    Student.token = data['data']['access_token'];
    Student value = Student.fromJson(data['data']['student']);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Student>>> getStudents(
      {http.Client? client}) async {
    client ??= client = http.Client();
    String url = baseUrl + 'students';
    var response = await client.get(Uri.parse(url));

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

  static Future<ApiReturnValue<bool>> logout(String token,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'logout/student';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue<bool>(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    bool isTokenRevoked = data['data'];
    String message = data['meta']['message'];
    Teacher.token = null;

    return ApiReturnValue<bool>(value: isTokenRevoked, message: message);
  }

  static Future<ApiReturnValue> changePasswordStudent(
      String currentPassword, String newPassword, String PasswordConfirmation,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'change-password/student';
    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${Student.token}"
        },
        body: jsonEncode(<String, String>{
          'current_password': currentPassword,
          'new_password': newPassword,
          'confirm_password': PasswordConfirmation
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);

    String message = data['meta']['message'];
    Student.token = null;
    String status = data['meta']['status'];
    // print(value);
    print('message');
    print(message);
    return ApiReturnValue(value: status, message: message);
  }
}
