import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(ParentInitial());
  Future<void> signIn(String username, String password) async {
    ApiReturnValue result = await ParentServices.SignIn(username, password);
    if (result.value != null) {
      emit(ParentLoaded(result.value));
    } else {
      emit(ParentLoadingFaield(result.message));
    }
  }
}
