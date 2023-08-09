import 'package:bloc/bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'class_room_cubit_state.dart';

class ClassRoomCubitCubit extends Cubit<ClassRoomCubitState> {
  ClassRoomCubitCubit() : super(ClassRoomCubitInitial());

  Future<void> getClassRoom() async {
    ApiReturnValue<List<ClassRoom>> result =
        await ClassRommServices.getClassRooms();

    if (result.value != null) {
      emit(ClassRoomLoaded(result.value));
    } else {
      emit(ClassRoomLoadingFailed(result.message));
    }
  }
}
