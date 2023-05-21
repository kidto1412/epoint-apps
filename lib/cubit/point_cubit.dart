import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit() : super(PointInitial());
  Future<void> getPoint(String nis) async {
    ApiReturnValue result = await PointServices.GetPoint(nis);
    if (result.value != null) {
      emit(PointLoaded(result.value));
    } else {
      emit(PointLoadingFaield(result.message));
    }
  }
}
