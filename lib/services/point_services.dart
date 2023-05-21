part of 'services.dart';

// import 'package:e_point/models/models.dart';

class PointServices {
  static Future<ApiReturnValue<List<Point>>> GetPoint(String nis) async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue();
  }
}
