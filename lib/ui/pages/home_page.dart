part of 'pages.dart';

class HomePage extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  color: Colors.white,
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi Welcome, ',
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                          Text('Fahriz Dimasqy')
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1611485988300-b7530defb8e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'))),
                      ),
                    ],
                  ),
                ),
                Menu()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
