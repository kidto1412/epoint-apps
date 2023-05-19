part of 'services.dart';

class StudentServices {
  static Future<ApiReturnValue<Student>> SignIn(
      String nis, String password) async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue();
  }
}
