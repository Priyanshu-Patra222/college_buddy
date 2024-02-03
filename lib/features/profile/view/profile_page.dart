import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/features/profile/widgets/student_details_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    // talker.debug("value $isDarkMode");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: Icon(Icons.arrow_back,
                    color: isDarkMode ? Colors.white : Colors.black))
            .pOnly(left: 10),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDarkMode = brightness == Brightness.light;
                });
                // talker.debug("value2 $isDarkMode");
              },
              icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff6C63FF),
                  width: 1.5,
                ),
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        Image.asset(R.ASSETS_ILLUSTRATIONS_PROFILE_PNG).image,
                  ),
                  Positioned(
                      bottom: 3,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDarkMode
                                ? Colors.grey
                                : Colors.grey.shade200),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ).h(30).w(30)),
                ],
              ).p8(),
            ),
            15.heightBox,
            const StudentDetails().p12(),
            20.heightBox,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: isDarkMode ? 20 : 0,
                shadowColor: const Color(0xff6C63FF),
                backgroundColor: const Color(0xff6C63FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Log out',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ).w(300),
            35.heightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date Of Joining : _ _ _ _ _",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            )
          ],
        ).p12(),
      ),
    );
  }
}
