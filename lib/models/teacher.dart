part of 'models.dart';

class Teacher extends Equatable {
  final int id;
  final String nip;
  final String password;
  final String name;
  final String position;
  final String gender;
  final String phoneNumber;
  final String date_and_place_of_birth;
  final String address;
  final String profile_photo_path;
  static String token;

  Teacher({
    this.id,
    this.nip,
    this.password,
    this.name,
    this.position,
    this.gender,
    this.phoneNumber,
    this.date_and_place_of_birth,
    this.address,
    this.profile_photo_path,
  });

  factory Teacher.fromJson(Map<String, dynamic> data) => Teacher(
      id: data['id'],
      nip: data['nip'],
      password: data['password'],
      name: data['name'],
      position: data['position'],
      gender: data['gender'],
      phoneNumber: data['phoneNumber'],
      date_and_place_of_birth: data['date_and_place_of_birth'],
      address: data['address'],
      profile_photo_path: data['profile_photo_path']);

  Teacher copyWith({
    int id,
    String nip,
    String password,
    String name,
    String position,
    String gender,
    String phoneNumber,
    String date_and_place_of_birth,
    String address,
    String profile_photo_path,
  }) =>
      Teacher(
          id: id ?? this.id,
          nip: nip ?? this.nip,
          password: password ?? this.password,
          name: name ?? this.name,
          position: position ?? this.position,
          gender: gender ?? this.gender,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          date_and_place_of_birth:
              date_and_place_of_birth ?? this.date_and_place_of_birth,
          address: address ?? this.address,
          profile_photo_path: profile_photo_path ?? this.profile_photo_path);
  // profile_photo_path: profile_photo_path ?? this.profile_photo_path,

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        nip,
        password,
        name,
        position,
        gender,
        phoneNumber,
        date_and_place_of_birth,
        address,
        profile_photo_path,
        token
      ];
}
