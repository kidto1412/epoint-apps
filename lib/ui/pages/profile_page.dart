part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoulStudent> fouls =
        (context.bloc<StudentCubit>().state as StudentLoaded)
            .student
            .violations;
    return GeneralPage(
      title: 'Profile Page',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      subtitle: 'this is your profile',
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1611485988300-b7530defb8e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                radius: 40,
              ),
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Text(
              (context.bloc<StudentCubit>().state as StudentLoaded)
                  .student
                  .name,
              style: TextStyle(
                  color: mainColor,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Poin',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Text(
              (context.bloc<StudentCubit>().state as StudentLoaded)
                  .student
                  .total_point
                  .toString(),
              style: TextStyle(
                  color: mainColor,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
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
                  (context.bloc<StudentCubit>().state as StudentLoaded)
                      .student
                      .nis,
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.class__outlined,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (context.bloc<StudentCubit>().state as StudentLoaded)
                      .student
                      .major,
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
                Text(
                  (context.bloc<StudentCubit>().state as StudentLoaded)
                      .student
                      .grade,
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(height: 199),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fouls.length,
              itemBuilder: (context, index) {
                FoulStudent foul = fouls[index];

                return ListTile(
                  title: Text(
                      foul.form_violation_name), // Menampilkan nama pelanggaran
                  subtitle: Text(foul.date),
                  onTap: () {
                    // Aksi ketika ListTile di-tap
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
