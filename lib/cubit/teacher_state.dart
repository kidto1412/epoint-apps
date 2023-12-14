part of 'teacher_cubit.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();

  @override
  List<Object> get props => [];
}

class TeacherInitial extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final Teacher teacher;
  // final List<Student> students;
  TeacherLoaded(this.teacher);

  @override
  List<Object> get props => [teacher];
}

class UpdateTeacherLoaded extends TeacherState {
  final Teacher? teacher;
  UpdateTeacherLoaded(this.teacher);
  @override
  List<Object> get props => [teacher ?? []];
}

class TeacherLoadingFaield extends TeacherState {
  final String? message;
  TeacherLoadingFaield(this.message);
  @override
  List<Object> get props => [message ?? ''];
}

class ProfilePictureUploaded extends TeacherState {
  final Teacher? teacher;

  ProfilePictureUploaded(this.teacher);

  @override
  List<Object> get props => [teacher ?? []];
}
