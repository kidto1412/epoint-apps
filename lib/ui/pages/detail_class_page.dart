part of 'pages.dart';

class DetailClassRoom extends StatelessWidget {
  final ClassRoom classRoom;

  DetailClassRoom({required this.classRoom});

  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
      title: classRoom.grade ?? '',
      subtitle: classRoom.major!.name ?? '',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Point: ${classRoom.vectorV.toString()}',
                  style: blackFontStyle1.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text('Siswa:', style: blackFontStyle2),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: classRoom.students!.length,
                  itemBuilder: (context, index) {
                    final student = classRoom.students![index];
                    return ExpansionTile(
                      title: Text(student!.name ?? ''),
                      subtitle: Text('NIS: ${student.nis}'),
                      children: [
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: student.violations!.length,
                          itemBuilder: (context, index) {
                            final foul = student.violations![index];
                            return ListTile(
                              title: Text(foul.form!.name ?? ''),
                              subtitle: Text(
                                  'Tanggal: ${foul.date}, Waktu: ${foul.time}'),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
