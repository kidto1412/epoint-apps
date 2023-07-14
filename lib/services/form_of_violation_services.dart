part of 'services.dart';

class FormViloationService {
  static Future<ApiReturnValue<List<FormOfViolation>>> getFormOfViolation(
      {http.Client client}) async {
    client ??= client = http.Client();

    String url = baseUrl + 'form-of-foul';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else {
      var data = jsonDecode(response.body);

      List<FormOfViolation> formV = (data['data'] as Iterable)
          .map((e) => FormOfViolation.formJson(e))
          .toList();
      print(formV);
      return ApiReturnValue(value: formV);
    }
    // print('response');
    // print(jsonEncode(response));
    // print(jsonEncode(response));

    // var data = jsonDecode(response.body);
    // print(data);
  }
}
