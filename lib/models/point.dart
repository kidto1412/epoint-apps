part of 'models.dart';

class Point extends Equatable {
  final int id;
  final String name;
  final DateTime time;
  final DateTime date;
  final String description;
  final String student_nis;
  final String teacher_nip;
  final String form_of_foul_id;
  final String phoneNumber;
  final String address;
  // final String profile_photo_path;
  Point(
      {this.id,
      this.name,
      this.time,
      this.date,
      this.description,
      this.student_nis,
      this.teacher_nip,
      this.form_of_foul_id,
      this.phoneNumber,
      this.address});

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        name,
        time,
        date,
        description,
        student_nis,
        teacher_nip,
        form_of_foul_id,
        phoneNumber,
        address,
      ];
}
