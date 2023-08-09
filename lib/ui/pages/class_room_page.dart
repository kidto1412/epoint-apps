part of 'pages.dart';

// ignore: use_key_in_widget_constructors
class ClassRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    // final state =
    //     context.watch<FormViolationCubit>().state as FormViolationLoaded;
    return GeneralGradientPage(
      title: 'Class',
      subtitle: 'This is the class page',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: BlocBuilder<ClassRoomCubitCubit, ClassRoomCubitState>(
            builder: (_, state) {
              if (state is ClassRoomLoaded) {
                if (state.classRoom.isEmpty) {
                  loadingIndicator;
                }
                return Column(
                  children: state.classRoom.asMap().entries.map((e) {
                    int index = e.key;
                    ClassRoom classRoom = e.value;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                        defaultMargin,
                        0,
                        defaultMargin,
                        16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(DetailClassRoom(
                            classRoom: classRoom,
                          ));
                        },
                        child: ClassRoomList(
                          classRoom: classRoom,
                          itemWidth: listItemWidth,
                          itemNumber: index + 1,
                        ),
                      ),
                    );
                  }).toList(),
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
