part of 'shared.dart';

Color greyColor = "8D92A3".toColor();

Color mainColor = "0081C9".toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(size: 45, color: mainColor);
