part of 'pages.dart';

class DetailStudent extends StatelessWidget {
  // const DetailStudent({ Key? key }) : super(key: key);
  final Student student;
  final List<Foul> fouls;

  DetailStudent({@required this.student, @required this.fouls});

  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
      title: 'Detail Student',
      subtitle: '',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                /// -- IMAGE
                Stack(
                  children: [
                    if (student.profile_photo_path != null)
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Container(
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
                      ),
                    if (student.profile_photo_path == null)
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
                const SizedBox(height: 10),
                Text(student.name, style: blackFontStyle1),
                Text(student.nis, style: greyFontStyle),
                Text(student.gender,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(student.date_and_place_of_birth,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(student.grade + ' ' + student.major,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(
                  'Total Point:' + ' ' + student.total_point.toString(),
                  style: greyFontStyle.copyWith(fontSize: 16),
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fouls.length,
                  itemBuilder: (context, index) {
                    final foul = fouls[index];
                    return Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 200,
                                child: Text(foul.form.name),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${foul.form.point}',
                              textAlign: TextAlign.right,
                            ),
                          )),
                        )
                      ],
                    );
                    // return ListTile(
                    //   title: Text(foul.form.name),
                    //   subtitle: Text(foul.date),
                    // );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
