import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());
  Future<void> signIn(String nip, String password) async {
    ApiReturnValue result = await TeacherServices.SignIn(nip, password);
    ApiReturnValue<List<Student>> studentsResult =
        await StudentServices.getStudents();
    if (result.value != null) {
      Teacher teacher = result.value;
      List<Student> students = studentsResult.value;
      emit(TeacherLoaded(teacher, students));
    } else {
      emit(TeacherLoadingFaield(result.message));
    }
  }

  Future<void> GetStudents() async {
    ApiReturnValue<List<Student>> result = await StudentServices.getStudents();
    if (result.value != null) {
      Teacher teacher;
      if (state is TeacherLoaded) {
        teacher = (state as TeacherLoaded).teacher;
        emit(TeacherLoaded(teacher, result.value));
      } else {
        emit(TeacherLoadingFaield(result.message));
      }
    } else {
      emit(TeacherLoadingFaield(result.message));
    }
  }
}
