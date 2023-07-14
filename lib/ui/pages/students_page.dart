part of 'pages.dart';

class StudentsPage extends StatefulWidget {
  // con  st StudentsPage({ Key? key }) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return GeneralPage(
      title: 'Students Page',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              //// Header
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'List Student',
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              //// Body
              Container(
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(child:
                    BlocBuilder<TeacherCubit, TeacherState>(
                        builder: (_, state) {
                  if (state is TeacherLoaded) {
                    return Column(
                      children: state.students
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                  right: defaultMargin,
                                  left: defaultMargin,
                                  bottom: 16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailStudent(
                                      student: e,
                                      fouls: e.fouls,
                                    ),
                                  );
                                },
                                child: StudentList(
                                    students: e, itemWidth: listItemWidth),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                })),
              )
            ],
          ),
        ],
      ),
    );
  }
}
