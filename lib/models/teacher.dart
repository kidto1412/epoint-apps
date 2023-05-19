part of 'models.dart';

class Teacher extends Equatable {
  final int id;
  final String nip;
  final String password;
  final String name;
  final String position;
  final String gender;
  final String phoneNumber;
  final DateTime date_and_place_of_birth;
  final String address;
  final String profile_photo_path;
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
      ];
}
