part of 'pages.dart';

class DetailStudent extends StatelessWidget {
  // const DetailStudent({ Key? key }) : super(key: key);
  final Student student;
  final List<Foul> fouls;

  DetailStudent({@required this.student, @required this.fouls});

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
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
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: NetworkImage(
                                  "http://10.0.2.2/epoint-api/public/storage/${student.profile_photo_path}"),
                              fit: BoxFit.cover,
                            )),
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

                    return ListTile(
                      title: Text(foul.form.name),
                      subtitle: Text(foul.date),
                    );
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
