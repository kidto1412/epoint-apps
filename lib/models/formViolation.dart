part of 'models.dart';

class FormOfViolation extends Equatable {
  final String id;
  final String name;
  final String point;
  final FoulCateogry foulCateogry;

  FormOfViolation({this.id, this.name, this.point, this.foulCateogry});

  @override
  // TODO: implement props
  List<Object> get props => [id, name, point, foulCateogry];
}
