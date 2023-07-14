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
      title: 'Sign In',
      subtitle: 'welcome to aplikasi e-point SMK DB',
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
                    ? 'Enter your NIS'
                    : _selectedUserType == UserType.teacher
                        ? 'Enter your NIP'
                        : 'Enter your Username',
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
                hintText: 'Enter your Password',
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
                  'Select login as:',
                  textAlign: TextAlign.left,
                )),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField<UserType>(
              value: _selectedUserType,
              onChanged: (UserType value) {
                setState(() {
                  _selectedUserType = value;
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
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : RaisedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        // panggil metod bloc
                        if (_selectedUserType == UserType.student) {
                          await context.bloc<StudentCubit>().signIn(
                              nisController.text, passwordController.text);
                          // jika sign in berhasil ambil state saat ini
                          StudentState state =
                              context.bloc<StudentCubit>().state;
                          if (state is StudentLoaded) {
                            // Panggil Data Point
                            context.bloc<StudentCubit>().GetStudents();
                            context
                                .bloc<FormViolationCubit>()
                                .getFormOfViolation();
                            Get.to(MainPage());
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
                                    (state as StudentLoadingFaield).message,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));

                              isLoading = false;
                            });
                          }
                        } else if (_selectedUserType == UserType.teacher) {
                          await context.bloc<TeacherCubit>().signIn(
                              nipController.text, passwordController.text);
                          TeacherState state =
                              context.bloc<TeacherCubit>().state;
                          if (state is TeacherLoaded) {
                            context
                                .bloc<FoulCategoryCubit>()
                                .getFoulCategories();
                            context
                                .bloc<FormViolationCubit>()
                                .getFormOfViolation();
                            context.bloc<TeacherCubit>().GetStudents();

                            Get.to(MainPageTeacher());
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
                                    (state as TeacherLoadingFaield).message,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ));

                              isLoading = false;
                            });
                          }
                        } else if (_selectedUserType == UserType.parent) {
                          await context.bloc<ParentCubit>().signIn(
                              usernameController.text, passwordController.text);
                        }
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text('Sign In',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                    )),
        ],
      ),
    );
  }
}

enum UserType {
  teacher,
  student,
  parent,
}
