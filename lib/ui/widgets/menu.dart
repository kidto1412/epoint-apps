part of 'widgets.dart';

class Menu extends StatelessWidget {
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
              onTap: () {},
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.podcasts_sharp,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Point',
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
              onTap: () {},
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Settings',
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
              onTap: () {},
              splashColor: mainColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.people,
                      size: 70,
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Profile',
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
