// import 'package:e_point/ui/pages/general_page.dart';
import 'package:camera/camera.dart';
import 'package:e_point/ui/pages/pages.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      //   home: GeneralPage(
      //     title: 'Home',
      //     subtitle: 'test',
      //     onBackButtonPressed: () {},
      //     child: Text('body'),
      //   ),
    );
  }
}
