import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  Future<void> signIn(String nis, String password) async {
    ApiReturnValue result = await StudentServices.SignIn(nis, password);
    ApiReturnValue<List<Student>> studentsResult =
        await StudentServices.getStudents();
    if (result.value != null) {
      Student student = result.value;
      List<Student> students = studentsResult.value;
      emit(StudentLoaded(student, students));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }

  Future<void> GetStudents() async {
    ApiReturnValue<List<Student>> result = await StudentServices.getStudents();
    if (result.value != null) {
      Student student;
      if (state is StudentLoaded) {
        student = (state as StudentLoaded).student;
        emit(StudentLoaded(student, result.value));
      } else {
        emit(StudentLoadingFaield(result.message));
      }
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }
}
