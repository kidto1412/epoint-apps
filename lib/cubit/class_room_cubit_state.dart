part of 'class_room_cubit.dart';

abstract class ClassRoomCubitState extends Equatable {
  const ClassRoomCubitState();

  @override
  List<Object> get props => [];
}

class ClassRoomCubitInitial extends ClassRoomCubitState {}

class ClassRoomLoaded extends ClassRoomCubitState {
  final List<ClassRoom>? classRoom;

  ClassRoomLoaded(this.classRoom);

  @override
  List<Object> get props => [classRoom ?? []];
}

class ClassRoomLoadingFailed extends ClassRoomCubitState {
  final String? message;

  ClassRoomLoadingFailed(this.message);

  @override
  List<Object> get props => [message ?? ''];
}
