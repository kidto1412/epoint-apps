part of 'services.dart';

// import 'package:e_point/models/models.dart';

class PointsServices {
  static Future<ApiReturnValue<List<Points>>> GetPoints() async {
    await Future.delayed(Duration(microseconds: 500));
    return ApiReturnValue();
  }
}
