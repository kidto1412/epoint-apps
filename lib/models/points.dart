part of 'models.dart';

class Points extends Equatable {
  final int id;
  final String name;
  final DateTime time;
  final DateTime date;
  final String description;
  final Student student;
  final Teacher teacher;
  final Parent parent;
  final String form_of_foul_id;
  final String phoneNumber;
  final String address;
  // final String profile_photo_path;
  Points(
      {this.id,
      this.name,
      this.time,
      this.date,
      this.description,
      this.student,
      this.teacher,
      this.parent,
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
        student,
        teacher,
        parent,
        form_of_foul_id,
        phoneNumber,
        address,
      ];
}
