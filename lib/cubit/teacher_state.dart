part of 'teacher_cubit.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();

  @override
  List<Object> get props => [];
}

class TeacherInitial extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final Teacher teacher;
  TeacherLoaded(this.teacher);

  @override
  List<Object> get props => [teacher];
}

class TeacherLoadingFaield extends TeacherState {
  final String message;
  TeacherLoadingFaield(this.message);
}
