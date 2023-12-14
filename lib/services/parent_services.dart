part of 'services.dart';

// import 'package:e_point/models/models.dart';

class ParentServices {
  static Future<ApiReturnValue<Parent>> SignIn(String username, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'login-parent';
    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Parent.token = data['data']['access_token'];
    Parent value = Parent.fromJson(data['data']['data']);
    print('value');
    print(value);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Student>>> getMyChildern(int id,
      {http.Client? client}) async {
    client ??= client = http.Client();
    print('id parent');
    print(id);
    String url = baseUrl + 'my_childern/$id';
    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      List<Student> students = (data['data'] as Iterable)
          .map((e) => Student.fromJsonList(e))
          .toList();
      print('students');
      print(students);
      return ApiReturnValue(value: students);
    }
  }
}
