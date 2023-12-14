part of 'models.dart';

class Student extends Equatable {
  final int? id;
  final String? nis;
  final String? name;
  final String? password;
  final String? date_and_place_of_birth;
  final String? gender;
  final String? phoneNumber;
  final String? address;
  final String? profile_photo_path;
  final int? id_parent;
  final String? id_class_room;
  static String? token;
  final int? total_point;
  final String? major;
  final String? grade;
  final List<FoulStudent>? violations;
  final List<Foul>? fouls;

  Student({
    this.id,
    this.nis,
    this.name,
    this.password,
    this.date_and_place_of_birth,
    this.gender,
    this.phoneNumber,
    this.address,
    this.profile_photo_path,
    this.id_parent,
    this.id_class_room,
    this.total_point,
    this.major,
    this.grade,
    this.fouls,
    this.violations,
  });

  factory Student.fromJson(Map<String, dynamic> data) => Student(
        id: data['id'],
        nis: data['nis'],
        name: data['name'],
        password: data['password'],
        date_and_place_of_birth: data['date_and_place_of_birth'],
        gender: data['gender'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        profile_photo_path: data['profile_photo_path'],
        id_parent: data['id_parent'],
        id_class_room: data['id_class_room'],
        total_point: data['total_point'],
        major: data['major'],
        grade: data['class'],
        violations: List<FoulStudent>.from(
            data['fouls'].map((x) => FoulStudent.fromJson(x))),
      );

  factory Student.fromJsonList(Map<String, dynamic> data) => Student(
        id: data['id'],
        nis: data['nis'],
        name: data['name'],
        password: data['password'],
        date_and_place_of_birth: data['date_and_place_of_birth'],
        gender: data['gender'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        profile_photo_path: data['profile_photo_path'],
        id_parent: data['id_parent'],
        id_class_room: data['id_class_room'],
        total_point: data['total_point'],
        major: data['class']['major']['name'],
        grade: data['class']['grade'],
        fouls: List<Foul>.from(data['violations'].map((x) => Foul.fromJson(x))),
      );

  Student copyWith(
          {int? id,
          String? nis,
          String? name,
          String? password,
          String? date_and_place_of_birth,
          String? gender,
          String? phoneNumber,
          String? address,
          String? profile_photo_path,
          int? id_parent,
          String? id_class_room,
          int? total_point,
          String? major,
          String? grade}) =>
      Student(
          nis: nis ?? this.nis,
          name: name ?? this.name,
          password: password ?? this.password,
          date_and_place_of_birth:
              date_and_place_of_birth ?? this.date_and_place_of_birth,
          gender: gender ?? this.gender,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          address: address ?? this.address,
          // profile_photo_path: profile_photo_path ?? this.profile_photo_path,
          id_parent: id_parent ?? this.id_parent,
          id_class_room: id_class_room ?? this.id_class_room,
          total_point: total_point ?? this.total_point,
          major: major ?? this.major,
          grade: grade ?? this.grade);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        nis,
        name,
        password,
        date_and_place_of_birth,
        gender,
        phoneNumber,
        address,
        // profile_photo_path,
        id_parent,
        id_class_room,
        total_point,
        major,
        grade,
        violations,
        fouls
      ];
}
