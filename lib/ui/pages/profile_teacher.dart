part of 'pages.dart';

class ProfileTeacherPage extends StatefulWidget {
  @override
  _ProfileTeacherPageState createState() => _ProfileTeacherPageState();
}

class _ProfileTeacherPageState extends State<ProfileTeacherPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Profile',
      subtitle: '',
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              //// Header
              Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 220,
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                              .teacher
                              .profile_photo_path ==
                          null)
                        SizedBox(
                          height: 20,
                        ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30, // Ukuran ikon avatar
                          ),
                        ),
                      ),
                      if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                              .teacher
                              .profile_photo_path !=
                          null)
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://10.0.2.2/epoint-api/public/storage/${(context.bloc<TeacherCubit>().state as TeacherLoaded).teacher.profile_photo_path}"),
                                  fit: BoxFit.cover)),
                        ),
                      Text(
                        (context.bloc<TeacherCubit>().state as TeacherLoaded)
                            .teacher
                            .name,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        (context.bloc<TeacherCubit>().state as TeacherLoaded)
                            .teacher
                            .position,
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  )),
              //// Body
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      children: ((selectedIndex == 0)
                              ? [
                                  'Edit Profile',
                                  'Home Address',
                                ]
                              : [
                                  'Help Center',
                                  'Privacy & Policy',
                                  'Term & Condition'
                                ])
                          .map((e) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: 16,
                                    left: defaultMargin,
                                    right: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e,
                                      style: blackFontStyle3,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Icon(Icons.arrow_right),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
              onPressed: () async {
                // setState(() {
                //   isLoading = true;
                // });
                // await context.bloc<FoulCubit>().submitFoul(Foul(
                //     time: timeController.text,
                //     date: dateController.text,
                //     description: descriptionController.text,
                //     student_nis: nisController.text,
                //     teacher_nip: nipController.text,
                //     form_of_foul_id: valPunishment));

                FoulState state = context.bloc<FoulCubit>().state;
                // TeacherState stateTeacher =
                context.bloc<TeacherCubit>().state;
                if (state is FoulLoaded) {
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
                        'Punishment Added',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPageTeacher()));
                } else {
                  Get.snackbar("", "",
                      backgroundColor: "D9435E".toColor(),
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
                        (state as FoulLoadingFaield).message,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ));
                  setState(() {
                    // isLoading = false;
                  });
                }
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.red,
              child: Text('Logout',
                  style: GoogleFonts.poppins().copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
