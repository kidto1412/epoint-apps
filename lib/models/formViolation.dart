part of 'models.dart';

class FormOfViolation extends Equatable {
  final String? id;
  final String? name;
  final int? point;
  final FoulCategory? foulCategory;
  final String? category;
  FormOfViolation(
      {this.id, this.name, this.point, this.foulCategory, this.category});

  factory FormOfViolation.formJson(Map<String, dynamic> data) =>
      FormOfViolation(
          id: data['id'],
          name: data['name'],
          point: data['point'] as int,
          category: data['category']['name']);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, point, foulCategory, category];
}
