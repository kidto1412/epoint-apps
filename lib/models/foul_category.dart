part of 'models.dart';

class FoulCategory extends Equatable {
  final String? id;
  final String? name;

  FoulCategory({
    this.id,
    this.name,
  });
  factory FoulCategory.fromJson(Map<String?, dynamic?> data) => FoulCategory(
        id: data['id'],
        name: data['name'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
