part of 'student_cubit.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoaded extends StudentState {
  final Student student;
  // final List<Student> students;

  StudentLoaded(this.student);

  @override
  List<Object> get props => [student];
}

class StudentsLoaded extends StudentState {
  // final Student student;
  final List<Student> students;
  StudentsLoaded(this.students);
  @override
  List<Object> get props => [students];
}

class PasswordStudentChangeLoaded extends StudentState {
  // final Student student;
  final List<Student>? students;
  PasswordStudentChangeLoaded(this.students);
  @override
  List<Object> get props => [students ?? []];
}

class StudentLoadingFaield extends StudentState {
  final String? message;

  StudentLoadingFaield(this.message);

  @override
  List<Object> get props => [message ?? ''];
}

class StudentsLoadingFaield extends StudentState {
  final String? message;

  StudentsLoadingFaield(this.message);

  @override
  List<Object> get props => [message ?? ''];
}
