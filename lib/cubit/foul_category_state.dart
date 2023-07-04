part of 'foul_category_cubit.dart';

abstract class FoulCategoryState extends Equatable {
  const FoulCategoryState();

  @override
  List<Object> get props => [];
}

class FoulCategoryInitial extends FoulCategoryState {}

class FoulCategoryLoaded extends FoulCategoryState {
  final List<FoulCategory> foul_categories;

  FoulCategoryLoaded(this.foul_categories);

  @override
  List<Object> get props => [foul_categories];
}

class FoulCategoryLoadingFailed extends FoulCategoryState {
  final String message;

  FoulCategoryLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
