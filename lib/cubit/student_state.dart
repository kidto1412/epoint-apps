part of 'student_cubit.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoaded extends StudentState {
  final Student student;
  final List<Student> students;

  StudentLoaded(this.student, this.students);

  @override
  List<Object> get props => [student, students];
}

class StudentLoadingFaield extends StudentState {
  final String message;

  StudentLoadingFaield(this.message);

  @override
  List<Object> get props => [message];
}
