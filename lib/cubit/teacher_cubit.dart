import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());
  Future<void> signIn(String nip, String password) async {
    ApiReturnValue result = await TeacherServices.SignIn(nip, password);
    if (result.value != null) {
      emit(TeacherLoaded(result.value));
    } else {
      emit(TeacherLoadingFaield(result.message));
    }
  }
}
