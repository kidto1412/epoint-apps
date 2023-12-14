part of 'widgets.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.count(
        padding: EdgeInsets.all(25),
        crossAxisCount: 2,
        children: [
          // Card(
          //   margin: EdgeInsets.all(8),
          //   child: InkWell(
          //     onTap: () {},
          //     splashColor: mainColor,
          //     child: Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(
          //             Icons.podcasts_sharp,
          //             size: 70,
          //             color: mainColor,
          //           ),
          //           SizedBox(
          //             height: 20,
          //           ),
          //           Text(
          //             'Point',
          //             style: greyFontStyle,
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
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
                      'Kelas',
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
                      'Peraturan',
                      style: greyFontStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          // Card(
          //   margin: EdgeInsets.all(8),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => StudentsPage()));
          //     },
          //     splashColor: mainColor,
          //     child: Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(
          //             Icons.group,
          //             size: 70,
          //             color: mainColor,
          //           ),
          //           SizedBox(
          //             height: 20,
          //           ),
          //           Text(
          //             'Students',
          //             style: greyFontStyle,
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
