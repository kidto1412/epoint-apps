import 'dart:convert';
import 'dart:io';

// import 'package:e_point/cubit/form_violation_cubit.dart';
import 'package:e_point/models/models.dart';
import 'package:http/http.dart' as http;
// part 'user_services.dart';
part 'parent_services.dart';
part 'student_services.dart';
// part 'foul_services.dart';
part 'teacher_services.dart';
part 'point_services.dart';
part 'points_services.dart';
part 'form_of_violation_services.dart';
part 'foul_category_services.dart';
part 'foul_services.dart';
part 'class_room_service.dart';

String baseUrl = "http://192.168.1.7/epoint-api/public/api/";
// String baseUrl = "http://10.0.2.2/epoint-api/public/api/";


// http://l
// String baseUrl =
//     "https://2cb8-2001-448a-3021-1334-95e8-f437-7934-9486.ngrok-free.app/epoint-api/public/api/";
// String baseUrl = "http://localhost/epoint-api/public/api/";
