part of 'pages.dart';

class SignInPage extends StatefulWidget {
  // const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  TextEditingController nisController = TextEditingController();
  TextEditingController nipController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserType _selectedUserType = UserType.student;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Pastikan untuk membuang controller ketika tidak diperlukan lagi
      nisController.dispose();
      nipController.dispose();
      usernameController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return GeneralPage(
      title: 'Halaman Masuk',
      subtitle: 'Selamat Datang di e-point SMK DB',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              _selectedUserType == UserType.student
                  ? 'NIS'
                  : _selectedUserType == UserType.teacher
                      ? 'NIP'
                      : 'Username',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: _selectedUserType == UserType.student
                  ? nisController
                  : _selectedUserType == UserType.teacher
                      ? nipController
                      : usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: _selectedUserType == UserType.student
                    ? 'Masukan  NIS'
                    : _selectedUserType == UserType.teacher
                        ? 'Masukan NIP'
                        : 'Masukan Username',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Password',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Masukan Password',
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Masuk Sebagai:',
                  textAlign: TextAlign.left,
                )),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField<UserType>(
              value: _selectedUserType,
              onChanged: (UserType? value) {
                setState(() {
                  _selectedUserType = value!;
                });
              },
              items: UserType.values.map((UserType userType) {
                return DropdownMenuItem<UserType>(
                  value: userType,
                  child: Text(userType.toString().split('.').last),
                );
              }).toList(),
            ),
          ),
          _selectedUserType == UserType.teacher
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 26.0, top: 24.0),
                      child: Text('Login Dengan Wajah'),
                    ),
                  ),
                )
              : SizedBox(),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        // panggil metod bloc
                        if (_selectedUserType == UserType.student) {
                          await context.read<StudentCubit>().signIn(
                              nisController.text, passwordController.text);
                          // jika sign in berhasil ambil state saat ini
                          StudentState state =
                              context.read<StudentCubit>().state;
                          if (state is StudentLoaded) {
                            // Panggil Data Point
                            context
                                .read<FormViolationCubit>()
                                .getFormOfViolation();

                            context.read<ClassRoomCubitCubit>().getClassRoom();
                            // Get.to(MainPage());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          } else {
                            setState(() {
                              Get.snackbar("", "",
                                  backgroundColor: "D9435E".toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    'Sign In Failed',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    (state as StudentLoadingFaield).message ??
                                        "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));

                              isLoading = false;
                            });
                          }
                        } else if (_selectedUserType == UserType.teacher) {
                          await context.read<TeacherCubit>().signIn(
                              nipController.text, passwordController.text);
                          TeacherState state =
                              context.read<TeacherCubit>().state;

                          if (state is TeacherLoaded) {
                            context
                                .read<FoulCategoryCubit>()
                                .getFoulCategories();

                            context
                                .read<FormViolationCubit>()
                                .getFormOfViolation();

                            context.read<StudentCubit>().GetStudents();
                            context.read<ClassRoomCubitCubit>().getClassRoom();
                            // Get.to(MainPageTeacher());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPageTeacher()));
                          } else {
                            setState(() {
                              Get.snackbar("", "",
                                  backgroundColor: "D9435E".toColor(),
                                  icon: Icon(
                                    MdiIcons.closeCircleOutline,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    'Sign In Failed',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    (state as TeacherLoadingFaield).message ??
                                        '',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));

                              isLoading = false;
                            });
                          }
                        }
                      },
                      child: Text('Masuk',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                    )),
        ],
      ),
    );
  }
}

enum UserType { teacher, student }
