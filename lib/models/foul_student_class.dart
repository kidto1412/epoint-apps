part of 'models.dart';

class FoulStudentClass extends Equatable {
  final int? id;
  final String? nis;
  final String? name;

  final String? date_and_place_of_birth;
  final String? gender;
  final String? phoneNumber;
  final String? address;

  final List<Foul>? violations;

  FoulStudentClass({
    this.id,
    this.nis,
    this.name,
    this.date_and_place_of_birth,
    this.gender,
    this.phoneNumber,
    this.address,
    this.violations,
  });

  factory FoulStudentClass.fromJson(Map<String, dynamic> data) =>
      FoulStudentClass(
        id: data['id'],
        nis: data['nis'],
        name: data['name'],
        date_and_place_of_birth: data['date_and_place_of_birth'],
        gender: data['gender'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        violations:
            List<Foul>.from(data['violations'].map((x) => Foul.fromJson(x))),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        nis,
        name,
        date_and_place_of_birth,
        gender,
        phoneNumber,
        address,
        violations,
      ];
}
