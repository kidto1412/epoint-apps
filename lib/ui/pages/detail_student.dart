part of 'pages.dart';

class DetailStudent extends StatelessWidget {
  // const DetailStudent({ Key? key }) : super(key: key);
  final Student student;

  DetailStudent({@required this.student});

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Detail Student',
      subtitle: '',
      onBackButtonPressed: () {
        Get.back();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                /// -- IMAGE
                Stack(
                  children: [
                    if (student.profile_photo_path != null)
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: NetworkImage(
                                  "http://10.0.2.2/epoint-api/public/storage/${student.profile_photo_path}"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    if (student.profile_photo_path == null)
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
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Container(
                    //     width: 35,
                    //     height: 35,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(100),
                    //         color: Colors.purple),
                    //     child: Icon(
                    //       Icons.edit,
                    //       color: Colors.black,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(student.name, style: blackFontStyle1),
                Text(student.gender,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(student.date_and_place_of_birth,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(student.grade + ' ' + student.major,
                    style: greyFontStyle.copyWith(fontSize: 16)),
                Text(
                  'Total Point:' + ' ' + student.total_point.toString(),
                  style: greyFontStyle.copyWith(fontSize: 16),
                ),

                const SizedBox(height: 20),

                /// -- BUTTON
                // SizedBox(
                //   width: 200,
                //   child: ElevatedButton(
                //     onPressed: () => Get.to(() => const UpdateProfileScreen()),
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                //     child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                //   ),
                // ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU
                // ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
                // ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
                // ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
                const Divider(),
                const SizedBox(height: 10),
                // ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
                // ProfileMenuWidget(
                //     title: "Logout",
                //     icon: LineAwesomeIcons.alternate_sign_out,
                //     textColor: Colors.red,
                //     endIcon: false,
                //     onPress: () {
                //       Get.defaultDialog(
                //         title: "LOGOUT",
                //         titleStyle: const TextStyle(fontSize: 20),
                //         content: const Padding(
                //           padding: EdgeInsets.symmetric(vertical: 15.0),
                //           child: Text("Are you sure, you want to Logout?"),
                //         ),
                //         confirm: Expanded(
                //           child: ElevatedButton(
                //             onPressed: () => AuthenticationRepository.instance.logout(),
                //             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                //             child: const Text("Yes"),
                //           ),
                //         ),
                //         cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                //       );
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
