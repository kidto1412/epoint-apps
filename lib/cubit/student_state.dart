part of 'student_cubit.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoaded extends StudentState {
  final Student student;
  StudentLoaded(this.student);

  @override
  List<Object> get props => [student];
}

class StudentLoadingFaield extends StudentState {
  final String message;
  StudentLoadingFaield(this.message);
}
