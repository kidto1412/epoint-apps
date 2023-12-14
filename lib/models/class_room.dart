part of 'models.dart';

class ClassRoom extends Equatable {
  final String? id;
  final String? grade;
  final double? vectorS;
  final double? vectorV;
  final Major? major;
  final List<FoulStudentClass?>? students;

  ClassRoom(
      {this.id,
      this.grade,
      this.vectorS,
      this.vectorV,
      this.major,
      this.students});

  factory ClassRoom.fromJson(Map<String, dynamic> data) => ClassRoom(
        id: data['id'],
        grade: data['grade'],
        vectorS: data['vectorS'].toDouble(),
        vectorV: data['vectorV'].toDouble(),
        major: Major.fromJson(data['major']),
        students: List<FoulStudentClass>.from(
            data['students'].map((x) => FoulStudentClass.fromJson(x))),
      );
// form: FormOfViolation.formJson(data['form'])

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        grade,
        vectorS,
        vectorV,
        major,
        students,
      ];
}
