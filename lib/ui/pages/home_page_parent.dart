part of 'pages.dart';

class HomePageParent extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final stateStudent = context.watch<StudentCubit>().state as StudentLoaded;
    final stateParent = context.watch<ParentCubit>().state as ParentLoaded;
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
                          Text(
                            'Hi Welcome, ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              (context.bloc<ParentCubit>().state
                                      as ParentLoaded)
                                  .parent
                                  .name,
                              style: TextStyle(color: Colors.white)),

                          // Text(stateTeacher != null ? "$stateTeacher" : '')
                        ],
                      ),
                      if ((context.bloc<ParentCubit>().state as ParentLoaded)
                              .parent
                              .profile_photo_path !=
                          null)
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://10.0.2.2/epoint-api/public/storage/${(context.bloc<ParentCubit>().state as ParentLoaded).parent.profile_photo_path}"),
                                  fit: BoxFit.cover)),
                        ),
                      if ((context.bloc<ParentCubit>().state as ParentLoaded)
                              .parent
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
                MenuParent()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
