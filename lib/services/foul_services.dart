part of 'services.dart';

class FoulServices {
  static Future<ApiReturnValue<Foul>> submitPunishment(Foul foul,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'foul';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Teacher.token}"
      },
      body: jsonEncode(<String, dynamic>{
        'time': foul.time,
        'date': foul.date,
        'description': foul.description,
        'student_nis': foul.student_nis,
        'teacher_nip': foul.teacher_nip,
        'form_of_foul_id': foul.form_of_foul_id,
      }),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed');
    }

    var data = jsonDecode(response.body);

    Foul value = Foul.fromJson(data['data']);
    print('foul value');
    print(value);
    return ApiReturnValue(value: value);
  }
}
