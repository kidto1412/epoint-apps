part of 'pages.dart';

class GeneralGradientPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Function? onBackButtonPressed;
  final Widget? child;
  final Color? backColor;

  GeneralGradientPage(
      {this.title = "title",
      this.subtitle = "subtitle",
      this.onBackButtonPressed,
      this.child,
      this.backColor});

  // const GeneralPage({Key? key}) : super(key: key);

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
            color: backColor ?? Colors.white,
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                            '36D1DC'.toColor(),
                            '5B86E5'.toColor()
                          ])),
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? Container(
                                  margin: EdgeInsets.only(right: 26),
                                  width: 24,
                                  height: 24,
                                  child: IconButton(
                                      onPressed: () {
                                        if (onBackButtonPressed != null) {
                                          onBackButtonPressed!();
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(title ?? "",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(subtitle ?? '',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                      color: "FAFAFC".toColor(),
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
