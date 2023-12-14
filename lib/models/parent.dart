part of 'models.dart';

class Parent extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? password;
  final String? date_and_place_of_birth;
  final String? phoneNumber;
  final String? address;
  final String? profile_photo_path;
  static String? token;
  factory Parent.fromJson(Map<String, dynamic> data) => Parent(
      id: data['id'] as int,
      username: data['username'],
      name: data['name'],
      password: data['password'],
      phoneNumber: data['phone_number'],
      date_and_place_of_birth: data['date_and_place_of_birth'],
      address: data['address'],
      profile_photo_path: data['profile_photo_path']);
  Parent({
    this.id,
    this.name,
    this.username,
    this.password,
    this.date_and_place_of_birth,
    this.phoneNumber,
    this.address,
    this.profile_photo_path,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        username,
        name,
        password,
        date_and_place_of_birth,
        phoneNumber,
        address,
        profile_photo_path,
        token
      ];
}
