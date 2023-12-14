part of 'services.dart';

class ClassRommServices {
  static Future<ApiReturnValue<List<ClassRoom>>> getClassRooms(
      {http.Client? client}) async {
    client ??= client = http.Client();
    String url = baseUrl + 'class/point';
    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      List<ClassRoom> classrooms =
          (data['data'] as Iterable).map((e) => ClassRoom.fromJson(e)).toList();
      print('classrooms');
      print(classrooms);
      return ApiReturnValue(value: classrooms);
    }
  }
}
