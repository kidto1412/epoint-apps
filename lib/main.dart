// import 'package:e_point/ui/pages/general_page.dart';
import 'package:camera/camera.dart';
import 'package:e_point/cubit/cubit.dart';

import 'package:e_point/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// import 'package:bloc/bloc.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => StudentCubit()),
        BlocProvider(create: (_) => ParentCubit()),
        BlocProvider(create: (_) => TeacherCubit()),

        // BlocProvider(create: (_) => PointCubit()),
        BlocProvider(create: (_) => FormViolationCubit()),
        BlocProvider(create: (_) => FoulCategoryCubit()),
        BlocProvider(create: (_) => FoulCubit()),
        BlocProvider(create: (_) => ClassRoomCubitCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
