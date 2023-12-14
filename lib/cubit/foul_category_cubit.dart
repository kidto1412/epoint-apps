// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_point/models/models.dart';
import 'package:e_point/services/services.dart';
import 'package:equatable/equatable.dart';

part 'foul_category_state.dart';

class FoulCategoryCubit extends Cubit<FoulCategoryState> {
  FoulCategoryCubit() : super(FoulCategoryInitial());

  Future<void> getFoulCategories() async {
    ApiReturnValue<List<FoulCategory>>? result =
        await FoulCategoryService.getFoulCategory();
    if (result.value != null) {
      List<FoulCategory>? categories = result.value;
      emit(FoulCategoryLoaded(categories));
    } else {
      emit(FoulCategoryLoadingFailed(result.message));
    }
  }
}
