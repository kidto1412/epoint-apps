part of 'widgets.dart';

class CustomBottomBarTeacher extends StatelessWidget {
  // const CustombBar({ Key? key }) : super(key: key);
  final int selectedIndex;
  final Function(int index)? onTap;

  CustomBottomBarTeacher({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    final teacherState = context.watch<TeacherCubit>().state as TeacherLoaded;
    final teacherPosition = teacherState.teacher.position;
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? mainColor : Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                if (_hasAccess(teacherPosition ?? '')) {
                  onTap!(1);
                } else {
                  _showAccessSnackBar(context);
                }
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.camera,
                  color: selectedIndex == 1 ? mainColor : Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.settings,
                  color: selectedIndex == 2 ? mainColor : Colors.grey,
                )),
          ),
        ],
      ),
    );
  }
}

bool _hasAccess(String position) {
  // Check if the user has access based on their position.
  return position == 'BK' ||
      position == 'Kesiswaan' ||
      position == 'kepala sekolah';
}

void _showAccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Anda tidak memiliki akses disini."),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
