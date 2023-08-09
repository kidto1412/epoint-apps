part of 'widgets.dart';

class ClassRoomList extends StatelessWidget {
  final ClassRoom classRoom;
  final double itemWidth;
  final int itemNumber;
  ClassRoomList(
      {@required this.classRoom,
      @required this.itemWidth,
      @required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: itemWidth - 80, // (60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      classRoom.grade,
                      style: blackFontStyle2,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      classRoom.major.name,
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ],
    );
  }
}
