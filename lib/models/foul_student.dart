part of 'models.dart';

class FoulStudent extends Equatable {
  final int? id;
  final String? date;
  final String? time;
  final String? description;
  final String? form_violation_name;
  final int? point;

  final String? teacher_nip;

  FoulStudent(
      {this.id,
      this.time,
      this.date,
      this.description,
      this.form_violation_name,
      this.point,
      this.teacher_nip});

  factory FoulStudent.fromJson(Map<String, dynamic> data) => FoulStudent(
        id: data['id'],
        time: data['time'],
        date: data['date'],
        description: data['description'],
        form_violation_name: data['form_violation_name'],
        point: data['point'],
        teacher_nip: data['teacher_nip'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        time,
        date,
        description,
        form_violation_name,
        point,
        teacher_nip,
      ];
}
