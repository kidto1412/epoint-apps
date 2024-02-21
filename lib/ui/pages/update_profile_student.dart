part of 'pages.dart';

class UpdateStudentProfile extends StatefulWidget {
  // const UpdateStudentProfile({ Key? key }) : super(key: key);

  @override
  State<UpdateStudentProfile> createState() => _UpdateStudentProfileState();
}

class _UpdateStudentProfileState extends State<UpdateStudentProfile> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passworConfirmationController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Update Password',
      subtitle: '',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Current Password",
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
              obscureText: true,
              controller: currentPasswordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your current password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "New Password",
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
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your new password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password Confirmation",
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
              obscureText: true,
              controller: passworConfirmationController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type Confirmation Pasword'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                // await context.bloc<StudentCubit>().ChangePasswordStudent(
                //     currentPasswordController.text,
                //     newPasswordController.text,
                //     passworConfirmationController.text);

                // StudentState state = context.bloc<StudentCubit>().state;

                var apiResult = await StudentServices.changePasswordStudent(
                    currentPasswordController.text,
                    newPasswordController.text,
                    passworConfirmationController.text);

                if (apiResult.value == 'success') {
                  Get.snackbar(
                    "",
                    "",
                    backgroundColor: Colors.green,
                    icon: Icon(
                      MdiIcons.checkCircleOutline,
                      color: Colors.white,
                    ),
                    titleText: Text(
                      "Success",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    messageText: Text(
                      'Profile Updated',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                } else {
                  Get.snackbar(
                    "",
                    "",
                    backgroundColor: "D9435E".toColor(),
                    icon: Icon(
                      MdiIcons.closeCircleOutline,
                      color: Colors.white,
                    ),
                    titleText: Text(
                      "Failed",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    messageText: Text(
                      "Failed",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  );
                }

                setState(() {
                  isLoading = false;
                });
              },
              child: Text(
                'Update Password',
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
