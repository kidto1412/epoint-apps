part of 'services.dart';

class FoulServices {
  static Future<ApiReturnValue<Foul>> submitPunishment(Foul foul,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'foul';
    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Teacher.token}"
      },
      body: jsonEncode(<String, String>{
        'time': foul.time,
        'date': foul.date,
        'description': foul.description,
        'student_nis': foul.student_nis,
        'teacher_nip': foul.teacher_nip,
        'form_of_foul_id': foul.form_of_foul_id,
      }),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print('response');
    print(response);
    Foul value = Foul.fromJson(data['data']['data']);
    return ApiReturnValue(value: value);
  }
}
