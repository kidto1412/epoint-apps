part of 'pages.dart';

class MainPageTeacher extends StatefulWidget {
  @override
  State<MainPageTeacher> createState() => _MainPageTeacherState();
}

class _MainPageTeacherState extends State<MainPageTeacher> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              Center(
                child: HomePageTeacher(),
              ),
              Center(
                child: PunishmentPage(),
              ),
              Center(
                child: ProfilePage(),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomBar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
