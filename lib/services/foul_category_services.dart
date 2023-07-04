part of 'services.dart';

class FoulCategoryService {
  static Future<ApiReturnValue<List<FoulCategory>>> getFoulCategory(
      {http.Client client}) async {
    client ??= client = http.Client();
    String url = baseUrl + 'foul-categories';
    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      List<FoulCategory> categories = (data['data'] as Iterable)
          .map((e) => FoulCategory.fromJson(e))
          .toList();
      print('categories');
      print(categories);
      return ApiReturnValue(value: categories);
    }
  }
}
