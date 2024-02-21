part of 'pages.dart';

class UpdateProfileTeacher extends StatefulWidget {
  @override
  _UpdateProfileTeacherState createState() => _UpdateProfileTeacherState();
}

class _UpdateProfileTeacherState extends State<UpdateProfileTeacher> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passworConfirmationController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
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

                var apiResult = await TeacherServices.changePasswordTeacher(
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
  // Teacher teacher;
  // File pictureFile;
  // bool isLoading = false;
  // TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController dateAndPlaceOfBirthController = TextEditingController();
  // // TextEditingController passwordController = TextEditingController();

  // // function loaded data
  // void dataTeacherNow() {
  //   final teacherState = context.read<TeacherCubit>().state;
  //   if (teacherState is TeacherLoaded) {
  //     final nip = teacherState.teacher.nip;
  //     final phoneNumber = teacherState.teacher.phoneNumber;
  //     final address = teacherState.teacher.address;

  //     phoneNumberController.text = nip;
  //     addressController.text = phoneNumber;
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return GeneralPage(
  //     title: 'Update Profile',
  //     subtitle: "Update your profile here",
  //     onBackButtonPressed: () {
  //       Get.back();
  //     },
  //     child: Column(
  //       children: [
  //         GestureDetector(
  //           onTap: () async {
  //             PickedFile pickedFile =
  //                 await ImagePicker().getImage(source: ImageSource.gallery);
  //             if (pickedFile != null) {
  //               pictureFile = File(pickedFile.path);
  //               setState(() {});
  //             }
  //           },
  //           child: Container(
  //             width: 110,
  //             height: 110,
  //             margin: EdgeInsets.only(top: 26),
  //             padding: EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                     image: AssetImage('assets/photo_border.png'))),
  //             child: (pictureFile != null)
  //                 ? Container(
  //                     decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         image: DecorationImage(
  //                             image: FileImage(pictureFile),
  //                             fit: BoxFit.cover)),
  //                   )
  //                 : Container(
  //                     decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         image: DecorationImage(
  //                             image: AssetImage('assets/photo.png'),
  //                             fit: BoxFit.cover)),
  //                   ),
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
  //           child: Text(
  //             "Phone Number",
  //             style: blackFontStyle2,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.symmetric(horizontal: defaultMargin),
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               border: Border.all(color: Colors.black)),
  //           child: TextField(
  //             controller: phoneNumberController,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 hintStyle: greyFontStyle,
  //                 hintText: 'Type your phone number'),
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
  //           child: Text(
  //             "Address",
  //             style: blackFontStyle2,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.symmetric(horizontal: defaultMargin),
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               border: Border.all(color: Colors.black)),
  //           child: TextField(
  //             controller: addressController,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 hintStyle: greyFontStyle,
  //                 hintText: 'Type your address'),
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.only(top: 24),
  //           height: 45,
  //           padding: EdgeInsets.symmetric(horizontal: defaultMargin),
  //           child: isLoading
  //               ? loadingIndicator
  //               : RaisedButton(
  //                   onPressed: () async {
  //                     var teacherUpdate = Teacher(
  //                       phoneNumber: phoneNumberController.text,
  //                       address: addressController.text,
  //                     );

  //                     setState(() {
  //                       isLoading = true;
  //                     });

  //                     await context.bloc<TeacherCubit>().UpdateProfile(
  //                           teacherUpdate,
  //                           pictureFile: pictureFile,
  //                         );

  //                     TeacherState state = context.bloc<TeacherCubit>().state;

  //                     if (state is TeacherLoaded) {
  //                       Get.snackbar(
  //                         "",
  //                         "",
  //                         backgroundColor: Colors.green,
  //                         icon: Icon(
  //                           MdiIcons.checkCircleOutline,
  //                           color: Colors.white,
  //                         ),
  //                         titleText: Text(
  //                           "Success",
  //                           style: GoogleFonts.poppins(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                         messageText: Text(
  //                           'Profile Updated',
  //                           style: GoogleFonts.poppins(color: Colors.white),
  //                         ),
  //                       );
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => MainPageTeacher(),
  //                         ),
  //                       );
  //                     } else if (state is TeacherLoadingFaield) {
  //                       Get.snackbar(
  //                         "",
  //                         "",
  //                         backgroundColor: "D9435E".toColor(),
  //                         icon: Icon(
  //                           MdiIcons.closeCircleOutline,
  //                           color: Colors.white,
  //                         ),
  //                         titleText: Text(
  //                           "Failed",
  //                           style: GoogleFonts.poppins(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                         messageText: Text(
  //                           state.message,
  //                           style: GoogleFonts.poppins(color: Colors.white),
  //                         ),
  //                       );
  //                     }

  //                     setState(() {
  //                       isLoading = false;
  //                     });
  //                   },
  //                   elevation: 0,
  //                   shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8)),
  //                   color: mainColor,
  //                   child: Text(
  //                     'Update',
  //                     style: GoogleFonts.poppins(
  //                         color: Colors.white, fontWeight: FontWeight.w500),
  //                   ),
  //                 ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
