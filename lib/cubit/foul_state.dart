part of 'foul_cubit.dart';

abstract class FoulState extends Equatable {
  const FoulState();

  @override
  List<Object> get props => [];
}

class FoulInitial extends FoulState {}

class FoulLoaded extends FoulState {
  final Foul foul;
  FoulLoaded(this.foul);

  @override
  List<Object> get props => [foul];
}

class FoulLoadingFaield extends FoulState {
  final String message;
  FoulLoadingFaield(this.message);
  @override
  List<Object> get props => [message];
}
