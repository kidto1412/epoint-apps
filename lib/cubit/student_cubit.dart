import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  Future<void> signIn(String nis, String password) async {
    ApiReturnValue result = await UserServices.SignIn(nis, password);
    if (result.value != null) {
      emit(StudentLoaded(result.value));
    } else {
      emit(StudentLoadingFaield(result.message));
    }
  }
}
