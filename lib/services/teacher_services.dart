part of 'services.dart';

class TeacherServices {
  static Future<ApiReturnValue<Teacher>> SignIn(String nip, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'login-teacher';
    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{'nip': nip, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Teacher.token = data['data']['access_token'];
    print('token');
    Teacher value = Teacher.fromJson(data['data']['teacher']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Teacher>> SignUp(
      Teacher teacher, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register-teacher';
    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String?, String?>{
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

  static Future<ApiReturnValue<String>> verificationImage(File image,
      {http.Client? client}) async {
    String url = baseUrl + 'verification';
    if (client == null) {
      client = http.Client();
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      return ApiReturnValue(
        value: await response.stream.bytesToString(),
      );
    } else {
      return ApiReturnValue(
        message: 'Request failed with status: ${response.statusCode}.',
      );
    }
  }

  static Future<ApiReturnValue<Teacher>> UpdateProfile(Teacher teacher,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'teacher/update-profile';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Teacher.token}"
      },
      body: jsonEncode(<String?, String?>{
        'phone_number': teacher.phoneNumber,
        'address': teacher.address,
      }),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print('profile');
    print(data);
    Teacher value = Teacher.fromJson(data['data']);
    if (pictureFile != null) {
      ApiReturnValue<String?> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
          profile_photo_path:
              "http://10.0.2.2/epoint-api/public/storage/" + result.value!,
        );
      }
    }
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + 'teacher/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${Teacher.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);
      print('data image');
      print(data);
      String imagePath = data['data'][0];
      print(imagePath);
      print('image path');
      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }

  static Future<ApiReturnValue<bool>> logout(String token,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'logout/teacher';
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

  static Future<ApiReturnValue> changePasswordTeacher(
      String currentPassword, String newPassword, String PasswordConfirmation,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'change-password/teacher';
    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${Teacher.token}"
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

  static Future<ApiReturnValue<Teacher>> loginFace(String nip,
      {http.Client? client}) async {
    client ??= client = http.Client();
    String url = baseUrl + 'teacher/find/' + nip;
    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      Teacher.token = data['data']['access_token'];
      Teacher value = Teacher.fromJson(data['data']['teacher']);
      return ApiReturnValue(value: value);
    }
  }
}
