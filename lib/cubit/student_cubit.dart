import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  Future<void> signIn(String nis, String password) async {
    ApiReturnValue result = await StudentServices.SignIn(nis, password);

    if (result.value != null) {
      emit(StudentLoaded(result.value));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }

  Future<void> GetStudents() async {
    ApiReturnValue<List<Student>> result = await StudentServices.getStudents();
    if (result.value != null) {
      emit(StudentsLoaded(result.value!));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }

  Future<void> GetStudentsByParent(int? id) async {
    ApiReturnValue<List<Student>> result =
        await ParentServices.getMyChildern(id!);
    if (result.value != null) {
      emit(StudentsLoaded(result.value!));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }

  Future<void> ChangePasswordStudent(String currentPassword, String newPassword,
      String passwordConfirmatiom) async {
    ApiReturnValue result = await StudentServices.changePasswordStudent(
        currentPassword, newPassword, passwordConfirmatiom);
    print('result change passowrd');
    print(result);
    if (result.value != null) {
      emit(PasswordStudentChangeLoaded(result.value));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }
}
