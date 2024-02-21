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
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nipController = TextEditingController();
  File? selectedImage;

  //  final categories = context.watch<FoulCategoryCubit>().state as FoulCategoryLoaded;

  // final stateTeacher = context.watch<TeacherCubit>().state as TeacherLoaded

  List filteredViolations = [];
  String? selectedCategory;
  String? valPunishment;
  String? nip;
  String? form_of_foul_id;

  @override
  void initState() {
    super.initState();
    loadNip();
    loadCurrentTime();
    fetchFormViolations();
  }

  void loadNip() {
    final teacherState = context.read<TeacherCubit>().state;
    if (teacherState is TeacherLoaded) {
      final name = teacherState.teacher.name;
      final nip = teacherState.teacher.nip;
      nipController.text = nip ?? '';
    }
  }

  void loadCurrentTime() {
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss').format(currentTime);
    String formattedMinute = DateFormat('mm').format(currentTime);

    setState(() {
      timeController.text = formattedTime;
    });
  }

  void getFilteredFouls() {
    final foulsState = context.read<FormViolationCubit>().state;
    if (foulsState is FormViolationLoaded) {
      filteredViolations = foulsState.formv!
          .where((violation) => violation.id == selectedCategory)
          .toList();
    }
  }

  void fetchFormViolations() {
    context.read<FormViolationCubit>().getFormOfViolation();
  }

  // send image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        context.watch<FoulCategoryCubit>().state as FoulCategoryLoaded;
    final fouls =
        context.watch<FormViolationCubit>().state as FormViolationLoaded;
    final teacher = context.watch<TeacherCubit>().state as TeacherLoaded;
    return GeneralGradientPage(
      title: 'Pelanggaran',
      subtitle: 'Tambahkan Pelanggaran',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
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
              'NIP Guru',
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
              controller: nipController,
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
              'Waktu',
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
              controller: timeController,
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
              'Tanggal',
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
                controller: dateController,
                obscureText: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                }),
          ),
          // Container(
          //   width: double.infinity,
          //   margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
          //   child: Text(
          //     'Type Of Punishment',
          //     style: blackFontStyle2,
          //   ),
          // ),
          // Container(
          //     width: double.infinity,
          //     margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Colors.white,
          //         border: Border.all(color: greyColor, width: 2)),
          //     child: DropdownButton<String>(
          //       hint: Text("Select Punishment"),
          //       underline: Container(),
          //       isExpanded: true,
          //       value: selectedCategory,
          //       items: categories.foul_categories.map((value) {
          //         return DropdownMenuItem<String>(
          //           child: Text(value.name),
          //           value: value.id,
          //         );
          //       }).toList(),
          //       onChanged: (value) {
          //         setState(() {
          //           selectedCategory = value;
          //           // valPunishment = null;
          //           getFilteredFouls();
          //           print('filtered');
          //           print(filteredViolations);
          //           print("You selected: $selectedCategory");
          //         });
          //       },
          //     )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Pilih Pelanggaran',
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
                  hint: Text("Pilih Pelanggaran"),
                  underline: Container(),
                  isExpanded: true,
                  value: valPunishment,
                  items: fouls.formv!.map((value) {
                    return DropdownMenuItem<String>(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              value.name ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      value: value.id,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      valPunishment = value!;
                      print("Pelanggaran : $valPunishment");
                    });
                  },
                  menuMaxHeight: 500)),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Deskripsi',
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
              controller: descriptionController,
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 0),
            child: Text(
              'Bukti Pelanggaran',
              style: blackFontStyle2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.0),
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: selectedImage != null
                    ? Image.file(selectedImage!, fit: BoxFit.cover)
                    : Icon(Icons.add_a_photo),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<FoulCubit>().submitFoul(Foul(
                            time: timeController.text,
                            date: dateController.text,
                            description: descriptionController.text,
                            student_nis: nisController.text,
                            teacher_nip: nipController.text,
                            form_of_foul_id: valPunishment,
                            status: 'SUBMITTED',
                            photo: selectedImage));

                        FoulState state = context.read<FoulCubit>().state;
                        // TeacherState stateTeacher =
                        context.read<TeacherCubit>().state;
                        if (state is FoulLoaded) {
                          Get.snackbar("", "",
                              backgroundColor: Colors.green,
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Success",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                'Punishment Added',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                          context
                              .read<FormViolationCubit>()
                              .getFormOfViolation();
                          context.read<StudentCubit>().GetStudents();
                          context.read<ClassRoomCubitCubit>().getClassRoom();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPageTeacher()));
                        } else {
                          Get.snackbar("", "",
                              backgroundColor: "D9435E".toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                "Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                (state as FoulLoadingFaield).message ?? '',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
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
