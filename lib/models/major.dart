part of 'models.dart';

class Major extends Equatable {
  final String id;
  final String name;

  Major({
    this.id,
    this.name,
  });
  factory Major.fromJson(Map<String, dynamic> data) => Major(
        id: data['id'],
        name: data['name'],
      );
  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        name,
      ];
}
