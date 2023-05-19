part of 'services.dart';

import 'package:e_point/models/models.dart';

class UserServices {
  static Future<ApiReturnValue<Student>> SignIn(
      String nis, String password) async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue(value: mockStudent);
  }
}
