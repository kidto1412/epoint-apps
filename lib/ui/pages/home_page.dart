part of 'pages.dart';

class HomePage extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateStudent = context.watch<StudentCubit>().state as StudentLoaded;
    List<FoulStudent?> fouls =
        (context.watch<StudentCubit>().state as StudentLoaded)
                .student
                .violations ??
            [];
    // final stateTeacher = context.watch<TeacherCubit>().state as TeacherLoaded;
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
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: ['36D1DC'.toColor(), '5B86E5'.toColor()])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hi Welcome, ',
                              style: greyFontStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                          Text(
                            (context.watch<StudentCubit>().state
                                        as StudentLoaded)
                                    .student
                                    .name ??
                                '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      if ((context.watch<StudentCubit>().state as StudentLoaded)
                              .student
                              .profile_photo_path !=
                          null)
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://epoint-api.com/storage/${(context.watch<StudentCubit>().state as StudentLoaded).student.profile_photo_path}"),
                                  fit: BoxFit.cover)),
                        ),
                      if ((context.watch<StudentCubit>().state as StudentLoaded)
                              .student
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
                Menu(),
                // ListView.builder(
                //   padding: EdgeInsets.all(8),
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: fouls.length,
                //   itemBuilder: (context, index) {
                //     FoulStudent foul = fouls[index];
                //     return Container(
                //       height: 50,
                //       child: Card(
                //         elevation: 2,
                //         child: Row(
                //           children: [
                //             Column(
                //               children: [
                //                 Container(
                //                   margin: EdgeInsets.only(left: 10),
                //                   width: 260,
                //                   child: Text(foul.form_violation_name),
                //                 ),
                //               ],
                //             ),
                //             Spacer(),
                //             Container(
                //                 child: Padding(
                //               padding: const EdgeInsets.all(10.0),
                //               child: Text('${foul.point}'),
                //             ))
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
