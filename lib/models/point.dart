part of 'models.dart';

class Point extends Equatable {
  final int id;
  final String name;
  final DateTime time;
  final DateTime date;
  final String description;
  final Student student;
  final Teacher teacher;
  final Parent parent;
  final FormOfViolation formOfViolation;
  final String phoneNumber;
  final String address;
  // final String profile_photo_path;
  Point(
      {this.id,
      this.name,
      this.time,
      this.date,
      this.description,
      this.student,
      this.teacher,
      this.parent,
      this.formOfViolation,
      this.phoneNumber,
      this.address});

  Point copyWith(
      {int id,
      String name,
      DateTime time,
      DateTime date,
      String description,
      Student student,
      Teacher teacher,
      Parent parent,
      FormOfViolation formOfViolation,
      String phoneNumber,
      String address}) {
    return Point(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      date: date ?? this.date,
      description: description ?? this.description,
      student: student ?? this.student,
      teacher: teacher ?? this.teacher,
      parent: parent ?? this.parent,
      formOfViolation: formOfViolation ?? this.formOfViolation,
    );
  }

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
        formOfViolation,
        phoneNumber,
        address,
      ];
}
