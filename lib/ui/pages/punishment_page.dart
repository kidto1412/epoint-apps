part of 'pages.dart';

// List<CameraDescription> cameras;

class PunishmentPage extends StatefulWidget {
  // const PunishmentPage({ Key? key }) : super(key: key);

  @override
  State<PunishmentPage> createState() => _PunishmentPageState();
}

class _PunishmentPageState extends State<PunishmentPage> {
  bool isLoading = false;
  TextEditingController nisController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List listTypeOfPunishment = ["Ringan", "Sedang", "Berat"];
  List listPunishment = [
    "Narkoba",
    "Kesiangan",
    "Merokok",
    "Baju Dikeluarkan",
    "Di tindik",
    "Membawa Alat Tajam",
    "Gondrong"
  ];
  String _valTypeOfPunishhment;
  String _valPunishment;
  String valPunishment;

  CameraImage cameraImage;
  CameraController cameraController;
  String output;

  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  loadCamera() {
    // WidgetsFlutterBinding.ensureInitialized();
    cameraController = CameraController(cameras[1], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController
              .startImageStream((imageStream) => {cameraImage = imageStream});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Punishment',
      subtitle: 'Add punishment for student',
      onBackButtonPressed: () {},
      child: Column(
        children: [
          Container(
              width: 250,
              height: 250,
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: !cameraController.value.isInitialized
                  ? Container()
                  : AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'NIS',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: nisController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: '',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Name',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: passwordController,
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Class',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: passwordController,
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Type Of Punishment',
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: greyColor, width: 2)),
              child: DropdownButton<String>(
                hint: Text("Select Punishment"),
                underline: Container(),
                isExpanded: true,
                value: _valTypeOfPunishhment,
                items: listTypeOfPunishment.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valTypeOfPunishhment = value;
                    print("You selected: $_valTypeOfPunishhment");
                  });
                },
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Punishment',
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: greyColor, width: 2)),
              child: DropdownButton<String>(
                hint: Text("Select Punishment"),
                underline: Container(),
                isExpanded: true,
                value: valPunishment,
                items: listPunishment.map((value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    valPunishment = value;
                    print("You selected: $valPunishment");
                  });
                },
              )),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? SpinKitFadingCircle(size: 45, color: mainColor)
                  : RaisedButton(
                      onPressed: () {},
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text('Punishment',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                    )),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
