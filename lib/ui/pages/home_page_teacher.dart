part of 'pages.dart';

class HomePageTeacher extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final stateStudent = context.watch<StudentCubit>().state as StudentLoaded;
    final stateTeacher = context.watch<TeacherCubit>().state as TeacherLoaded;
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  color: Colors.white,
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi Welcome, ',
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text((context.bloc<TeacherCubit>().state
                                  as TeacherLoaded)
                              .teacher
                              .name),

                          // Text(stateTeacher != null ? "$stateTeacher" : '')
                        ],
                      ),
                      if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                              .teacher
                              .profile_photo_path !=
                          null)
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://10.0.2.2/epoint-api/public/storage/${(context.bloc<TeacherCubit>().state as TeacherLoaded).teacher.profile_photo_path}"),
                                  fit: BoxFit.cover)),
                        ),
                      if ((context.bloc<TeacherCubit>().state as TeacherLoaded)
                              .teacher
                              .profile_photo_path ==
                          null)
                        Container(
                          width: 50,
                          height: 50,
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
                    ],
                  ),
                ),
                MenuTeacher()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
