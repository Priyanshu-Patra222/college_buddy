import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/bootstrap.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/theme/theme_controller.dart';
import 'package:college_buddy/features/profile/widgets/student_details_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final isdarkMode = ref.read(themecontrollerProvider);
    // talker.debug("value2 $isdarkMode");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            )).pOnly(left: 10),
        actions: [
          IconButton(
              onPressed: () {
                ref.watch(themecontrollerProvider.notifier).changeTheme(
                    isdarkMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
                setState(() {
                  isdarkMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                });
              },
              icon: Icon(isdarkMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode))
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
                    // backgroundColor: Colors.white,
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
                            color: isdarkMode == ThemeMode.light
                                ? Colors.grey.shade200
                                : Colors.grey),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
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
                elevation: isdarkMode == ThemeMode.light ? 0 : 20,
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
