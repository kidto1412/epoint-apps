import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

// part 'f.dart';
part 'foul_state.dart';

class FoulCubit extends Cubit<FoulState> {
  FoulCubit() : super(FoulInitial());

  Future<void> submitFoul(Foul punishment) async {
    ApiReturnValue<Foul> result =
        await FoulServices.submitPunishment(punishment);
    if (result.value != null) {
      print('result value');
      print(result.value);
      emit(FoulLoaded(result.value));
    } else {
      emit(FoulLoadingFaield(result.message));
    }
  }
}
