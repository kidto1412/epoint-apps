part of 'parent_cubit.dart';

abstract class ParentState extends Equatable {
  const ParentState();

  @override
  List<Object> get props => [];
}

class ParentInitial extends ParentState {}

class ParentLoaded extends ParentState {
  final Parent parent;
  ParentLoaded(this.parent);

  @override
  List<Object> get props => [parent];
}

class ParentLoadingFaield extends ParentState {
  final String? message;
  ParentLoadingFaield(this.message);
  @override
  List<Object> get props => [message ?? ''];
}
