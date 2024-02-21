part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoulStudent> fouls =
        (context.watch<StudentCubit>().state as StudentLoaded)
                .student
                .violations
                ?.cast<FoulStudent>() ??
            [];

    return GeneralGradientPage(
      title: 'Profil Page',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      subtitle: 'Halaman profil',
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
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
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                (context.watch<StudentCubit>().state as StudentLoaded)
                        .student
                        .name ??
                    '',
                style: TextStyle(
                    color: mainColor,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Poin',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                (context.watch<StudentCubit>().state as StudentLoaded)
                    .student
                    .total_point
                    .toString(),
                style: TextStyle(
                    color: mainColor,
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    Get.to(UpdateStudentProfile());
                  },
                  child: Text('Update Password',
                      style:
                          GoogleFonts.poppins().copyWith(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.perm_identity,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (context.watch<StudentCubit>().state as StudentLoaded)
                          .student
                          .nis ??
                      "",
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.class_outlined,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (context.watch<StudentCubit>().state as StudentLoaded)
                          .student
                          .major ??
                      '',
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
                Text(
                  (context.watch<StudentCubit>().state as StudentLoaded)
                          .student
                          .grade ??
                      '',
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Data Pelanggaran'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fouls!.length,
              itemBuilder: (context, index) {
                FoulStudent foul = fouls[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 260,
                            child: Text(foul.form_violation_name ?? ''),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 260,
                            child: Text(
                                'Guru pencatat: ${foul.teacher_name ?? ''}'),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('${foul.point}'),
                    ))
                  ],
                );
                // return ListTile(
                //   title: Text(
                //       foul.form_violation_name), // Menampilkan nama pelanggaran
                //   subtitle: Text(foul.date),
                // );
              },
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
