part of 'pages.dart';

class VerificationPage extends StatefulWidget {
  // const VerificationPage({ Key? key }) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  CameraController? cameraController;
  CameraImage? cameraImage;
  File? _image;
  Teacher? teacher;
  String? nipTeacher;
  @override
  void initState() {
    super.initState();
    initializieCamera();
    // loadNip();
  }

  // void loadNip() {
  //   final teacherState = context.read<TeacherCubit>().state;
  //   if (teacherState is TeacherLoaded) {
  //     final name = teacherState.teacher.name;
  //     final nip = teacherState.teacher.nip;
  //     nipTeacher = nip;
  //   }
  // }

  initializieCamera() {
    WidgetsFlutterBinding.ensureInitialized();
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<void> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/input_images';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';
    try {
      if (!cameraController!.value.isInitialized) {
        return null;
      }
      if (cameraController!.value.isTakingPicture) {
        return null;
      }
      XFile file = await cameraController!.takePicture();
      await file.saveTo(filePath);
      _image = File(filePath);
      await sendImageToAPI(_image!);
    } catch (e) {
      return null;
    }
    // return File(_image);
  }

  Future<void> sendImageToAPI(File imageFile) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Menggunakan package http untuk mengirim gambar ke API
      String url = baseUrl + 'teacher/face-matching';
      var uri = Uri.parse(url);

      var request = http.MultipartRequest('POST', uri)
        ..headers["Content-Type"] = "multipart/form-data"
        ..headers["Authorization"] = "Bearer ${Teacher.token}";

      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));
      var response = await request.send();

      // request.files
      //     .add(await http.MultipartFile.fromPath('image', imageFile.path));
      // var response = await request.send();

      if (response.statusCode == 200) {
        String responseData = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseData);
        String status = jsonResponse['result']['status'];
        String label = jsonResponse['result']['label'];
        print('label : $label');
        print(status);

        if (status == 'success') {
          await context.read<TeacherCubit>().signInFace(label);
          TeacherState state = context.read<TeacherCubit>().state;

          if (state is TeacherLoaded) {
            await context.read<FoulCategoryCubit>().getFoulCategories();
            await context.read<FormViolationCubit>().getFormOfViolation();
            await context.read<StudentCubit>().GetStudents();
            await context.read<ClassRoomCubitCubit>().getClassRoom();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainPageTeacher()));

            Get.snackbar("", "",
                backgroundColor: Colors.green,
                icon: Icon(
                  MdiIcons.closeCircleOutline,
                  color: Colors.white,
                ),
                titleText: Text(
                  "Success",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                messageText: Text(
                  'Login Success',
                  style: GoogleFonts.poppins(color: Colors.white),
                ));
          } else {
            Get.snackbar("", "",
                backgroundColor: Colors.green,
                icon: Icon(
                  MdiIcons.closeCircleOutline,
                  color: Colors.white,
                ),
                titleText: Text(
                  "Faield",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                messageText: Text(
                  'This is not your face',
                  style: GoogleFonts.poppins(color: Colors.white),
                ));
          }
          // if (nipTeacher == label) {
          //   print('image matched');
          // } else {}
          // print('Image uploaded successfully');
        } else {
          Get.snackbar("", "",
              backgroundColor: Colors.green,
              icon: Icon(
                MdiIcons.closeCircleOutline,
                color: Colors.white,
              ),
              titleText: Text(
                "Failed",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              messageText: Text(
                'Try Again',
                style: GoogleFonts.poppins(color: Colors.white),
              ));
        }

        // Berhasil mengirim gambar ke API
        // Lakukan sesuatu dengan respons API jika diperlukan
      } else {
        // Gagal mengirim gambar ke API
        print('Failed to upload image');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (!cameraController!.value.isInitialized) {
      return loadingIndicator;
    }
    return GeneralGradientPage(
        title: 'Masuk',
        subtitle: '',
        onBackButtonPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        },
        child: Column(
          children: [
            !cameraController!.value.isInitialized
                ? Container()
                : CameraPreview(cameraController!),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.width /
            //       cameraController.value.aspectRatio,
            //   child:
            //       ? Container()
            //       : AspectRatio(
            //           aspectRatio: cameraController.value.aspectRatio,
            //           child: CameraPreview(cameraController)),
            // ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndicator
                    : ElevatedButton(
                        onPressed: () async {
                          takePicture();
                        },
                        child: Text('Sign In',
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.white)),
                      )),
          ],
        ));
  }
}
