part of 'widgets.dart';

class StudentList extends StatelessWidget {
  final Student students;
  final double itemWidth;
  final int itemNumber;
  StudentList(
      {@required this.students,
      @required this.itemWidth,
      @required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (students.profile_photo_path != null)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        "http://10.0.2.2/epoint-api/public/storage/${students.profile_photo_path}"),
                    fit: BoxFit.cover)),
          ),
        if (students.profile_photo_path == null)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30, // Ukuran ikon avatar
              ),
            ),
          ),
        SizedBox(
          width: itemWidth - 80, // (60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  students.name,
                  style: blackFontStyle2,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  students.grade + " " + students.major,
                  style: greyFontStyle.copyWith(fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
