part of 'pages.dart';

class PointPageChildern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
      title: 'Point Siswa',
      // subtitle: classRoom.major.name,
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (_, state) {
              if (state is StudentsLoaded) {
                return Container(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Students have a viloations:',
                          style: blackFontStyle2),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.students.length,
                        itemBuilder: (context, index) {
                          final student = state.students[index];
                          return ExpansionTile(
                            title: Text(student.name ?? ""),
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
                                    title: Text(foul.form_violation_name ?? ''),
                                    subtitle: Text(
                                        'Date: ${foul.date}, Time: ${foul.time}'),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
