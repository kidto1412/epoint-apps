part of 'widgets.dart';

class FoulListItem extends StatelessWidget {
  final FormOfViolation formviolation;
  final double itemWidth;
  final int itemNumber;
  FoulListItem(
      {@required this.formviolation,
      @required this.itemWidth,
      @required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(itemNumber.toString()),
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: 12),
        ),
        SizedBox(
          width: itemWidth - 80, // (60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formviolation.category,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                formviolation.name,
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
      ],
    );
  }
}
