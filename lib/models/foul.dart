part of 'models.dart';

class Foul extends Equatable {
  final String? time;
  final String? date;
  final String? description;
  final String? student_nis;
  final String? teacher_nip;
  final String? form_of_foul_id;
  final FormOfViolation? form;
  final String? status;
  final File? photo;
  final Teacher? teacher;

  Foul(
      {this.time,
      this.date,
      this.description,
      this.student_nis,
      this.teacher_nip,
      this.form_of_foul_id,
      this.form,
      this.status,
      this.photo,
      this.teacher});

  factory Foul.fromJson(Map<String, dynamic> data) => Foul(
      time: data['time'],
      date: data['date'],
      description: data['description'],
      student_nis: data['student_nis'],
      teacher_nip: data['teacher_nip'],
      form_of_foul_id: data['form_of_foul_id'],
      form:
          data['form'] != null ? FormOfViolation.formJson(data['form']) : null,
      status: data['status'],
      photo: data['foto'] != null ? File(data['photo']) : null,
      teacher:
          data['teacher'] != null ? Teacher.fromJson(data['teacher']) : null);

  Foul copyWith(
          {String? time,
          String? date,
          String? description,
          String? student_nis,
          String? teacher_nip,
          String? form_of_foul_id,
          String? status}) =>
      Foul(
        time: time ?? this.time,
        date: date ?? this.date,
        description: description ?? this.description,
        student_nis: student_nis ?? this.student_nis,
        teacher_nip: teacher_nip ?? this.teacher_nip,
        form_of_foul_id: form_of_foul_id ?? this.form_of_foul_id,
        status: status ?? this.status,
        photo: photo ?? this.photo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        time,
        date,
        description,
        student_nis,
        teacher_nip,
        form_of_foul_id,
        form,
        status,
        photo,
        teacher
      ];
}
