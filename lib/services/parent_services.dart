part of 'services.dart';

import 'package:e_point/models/models.dart';

class TeacherServices {
  static Future<ApiReturnValue<Parent>> SignIn(
      String username, String password) async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue();
  }
}
