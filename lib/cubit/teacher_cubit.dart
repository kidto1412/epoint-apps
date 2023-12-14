// import 'dart:html';

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_point/cubit/cubit.dart';
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

  Future<void> signInFace(String nip) async {
    ApiReturnValue result = await TeacherServices.loginFace(nip);
    if (result.value != null) {
      emit(TeacherLoaded(result.value));
    } else {
      emit(TeacherLoadingFaield(result.message));
    }
  }

  Future<void> UpdateProfile(Teacher teacher, {File? pictureFile}) async {
    ApiReturnValue<Teacher> result =
        await TeacherServices.UpdateProfile(teacher, pictureFile: pictureFile);
    print('result update');
    print(result);
    if (result.value != null) {
      emit(TeacherLoaded(result.value!));
    } else {
      emit(TeacherLoadingFaield(result.message));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await TeacherServices.uploadProfilePicture(pictureFile);
    print('update photo');
    print(result);
    if (result.value != null) {
      emit(TeacherLoaded((state as TeacherLoaded).teacher.copyWith(
          profile_photo_path:
              "http://10.0.2.2/epoint-api/public/storage/" + result.value!)));
    }
  }
}
