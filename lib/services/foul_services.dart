part of 'services.dart';

class FoulServices {
  static Future<ApiReturnValue<Foul>> submitPunishment(Foul foul,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'foul';
    // var response = await client.post(
    //   Uri.parse(url),
    //   headers: {
    //     "Content-Type": "application/json",
    //     "Authorization": "Bearer ${Teacher.token}"
    //   },
    //   body: jsonEncode(<String, dynamic>{
    // 'time': foul.time,
    // 'date': foul.date,
    // 'description': foul.description,
    // 'student_nis': foul.student_nis,
    // 'teacher_nip': foul.teacher_nip,
    // 'form_of_foul_id': foul.form_of_foul_id,
    // 'status': foul.status,
    // 'photo': foul.photo
    //   }),
    // );
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer ${Teacher.token}",
      "Content-type": "multipart/form-data"
    };
    final file = await http.MultipartFile.fromPath('photo', foul.photo!.path);
    request.files.add(file);
    request.headers.addAll(headers);

    request.fields.addAll({
      'time': foul.time ?? '',
      'date': foul.date ?? '',
      'description': foul.description ?? '',
      'student_nis': foul.student_nis ?? '',
      'teacher_nip': foul.teacher_nip ?? '',
      'form_of_foul_id': foul.form_of_foul_id ?? '',
      'status': foul.status ?? '',
    });

    var response = await request.send();
    var result = await http.Response.fromStream(response);
    var resultData = json.decode(result.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed');
    }

    // var data = jsonDecode(response.);
    // print('data $data');

    Foul value = Foul.fromJson(resultData['data']);
    print('value $value');
    // print('foul value');
    // print(value);
    return ApiReturnValue(value: value);
  }
}
