part of 'models.dart';

class Student extends Equatable {
  final int id;
  final String nis;
  final String name;
  final String password;
  final DateTime date_and_place_of_birth;
  final String gender;
  final String phoneNumber;
  final String address;
  final String profile_photo_path;
  final int id_parent;
  final String id_class_room;
  Student(
      {this.id,
      this.nis,
      this.name,
      this.password,
      this.date_and_place_of_birth,
      this.gender,
      this.phoneNumber,
      this.address,
      this.profile_photo_path,
      this.id_parent,
      this.id_class_room});

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        nis,
        name,
        password,
        date_and_place_of_birth,
        gender,
        phoneNumber,
        address,
        profile_photo_path,
        id_parent,
        id_class_room
      ];
}

Student mockStudent = Student(
  id: 1,
  name: 'Fahriz Dimasqy',
  address: "Kp.Cempaka putih",
  password: '47',
  phoneNumber: "085312858608",
  // date_and_place_of_birth: "12-09-2001",
  gender: "Laki-laki",
  nis: 'dimasqy@gmail.com',
  profile_photo_path: "assets/images/shoes1.jpg",
);
