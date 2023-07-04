part of 'teacher_cubit.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();

  @override
  List<Object> get props => [];
}

class TeacherInitial extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final Teacher teacher;
  final List<Student> students;
  TeacherLoaded(this.teacher, this.students);

  @override
  List<Object> get props => [teacher, students];
}

class TeacherLoadingFaield extends TeacherState {
  final String message;
  TeacherLoadingFaield(this.message);
  @override
  List<Object> get props => [message];
}
