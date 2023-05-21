part of 'point_cubit.dart';

abstract class PointState extends Equatable {
  const PointState();

  @override
  List<Object> get props => [];
}

class PointInitial extends PointState {}

class PointLoaded extends PointState {
  final Point point;
  PointLoaded(this.point);

  @override
  List<Object> get props => [point];
}

class PointLoadingFaield extends PointState {
  final String message;
  PointLoadingFaield(this.message);
}
