import 'package:e_point/models/models.dart';

import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_violation_state.dart';

class FormViolationCubit extends Cubit<FormViolationState> {
  FormViolationCubit() : super(FormViolationInitial());

  Future<void> getFormOfViolation() async {
    ApiReturnValue<List<FormOfViolation>> result =
        await FormViloationService.getFormOfViolation();

    if (result.value != null) {
      emit(FormViolationLoaded(result.value));
    } else {
      emit(FormViolationLoadingFailed(result.message));
    }
  }
}
