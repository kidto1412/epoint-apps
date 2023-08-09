part of 'widgets.dart';

class MenuTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.count(
        padding: EdgeInsets.all(25),
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Get.to(VerificationPage());
              },
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.note_alt,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Punisment',
                      style: greyFontStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Get.to(ClassRoomPage());
              },
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.class_,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Class',
                      style: greyFontStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RulesPage()));
              },
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rule,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rules',
                      style: greyFontStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentsPage()));
              },
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.group,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Students',
                      style: greyFontStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
