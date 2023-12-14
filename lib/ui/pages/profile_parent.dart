part of 'pages.dart';

class ProfileParentPage extends StatefulWidget {
  @override
  _ProfileParentPageState createState() => _ProfileParentPageState();
}

class _ProfileParentPageState extends State<ProfileParentPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralGradientPage(
      title: 'Profil',
      subtitle: '',
      child: Column(
        children: [
          //// Header
          Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 220,
              margin: EdgeInsets.only(bottom: defaultMargin),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ((context.watch<ParentCubit>().state as ParentLoaded)
                          .parent
                          .profile_photo_path ==
                      null)
                    SizedBox(
                      height: 20,
                    ),
                  Container(
                    width: 60,
                    height: 60,
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
                  if ((context.watch<ParentCubit>().state as ParentLoaded)
                          .parent
                          .profile_photo_path !=
                      null)
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://epoint-api.com/storage/${(context.watch<ParentCubit>().state as ParentLoaded).parent.profile_photo_path}"),
                              fit: BoxFit.cover)),
                    ),
                  Text(
                    (context.watch<ParentCubit>().state as ParentLoaded)
                            .parent
                            .name ??
                        '',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.to(UpdateProfileTeacher());
                      },
                      child: Text('Update Password',
                          style: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              )),
          //// Body
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, bottom: 10),
                  child: Text(
                    'Profile',
                    style: blackFontStyle2,
                  ),
                ),
                Divider(),
                Column(
                  children: ((selectedIndex == 0)
                          ? [
                              'Username' +
                                  ': ' +
                                  ((context.watch<ParentCubit>().state
                                              as ParentLoaded)
                                          .parent
                                          .username ??
                                      ''),
                              'Tempat Tanggal Lahir' +
                                  ': ' +
                                  ((context.watch<ParentCubit>().state
                                              as ParentLoaded)
                                          .parent
                                          .date_and_place_of_birth ??
                                      ''),
                              'Phone Number' +
                                  ': ' +
                                  ((context.watch<ParentCubit>().state
                                              as ParentLoaded)
                                          .parent
                                          .phoneNumber ??
                                      ''),
                              'Address' +
                                  ': ' +
                                  ((context.watch<ParentCubit>().state
                                              as ParentLoaded)
                                          .parent
                                          .address ??
                                      '')
                            ]
                          : [
                              'Help Center',
                              'Privacy & Policy',
                              'Term & Condition'
                            ])
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                                bottom: 16,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: blackFontStyle3,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async {
                var apiResult =
                    await TeacherServices.logout(Teacher.token ?? "");
                if (apiResult.value == true) {
                  // Jika logout berhasil, lakukan navigasi ke halaman login
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                } else {
                  // Jika logout gagal, tampilkan pesan error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Logout Error'),
                      content: Text(apiResult.message ?? ""),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Logout',
                  style: GoogleFonts.poppins().copyWith(color: Colors.white)),
            ),
          ),

          SizedBox(height: 100)
        ],
      ),
    );
  }
}
