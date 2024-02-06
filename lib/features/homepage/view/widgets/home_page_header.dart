import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final username = ref
                        .watch(loginDbProvider)
                        .getLoginModel()
                        ?.student
                        .name;
                    return Text(
                      "Hey, $username!",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        overflow: TextOverflow.clip,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Text(
                  "Keep Smiling, Keep Shining 😅",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    overflow: TextOverflow.clip,
                    fontSize: 13,
                    color: AppColors.grey500,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.navigateTo(const ProfileRoute());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xff6C63FF),
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      Image.asset(R.ASSETS_ILLUSTRATIONS_PROFILE_PNG).image,
                ),
              ),
            )
          ],
        ).pOnly(top: 15),
        TextField(
          autofocus: false,
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            hintText: 'Search for the updates here ...',
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              overflow: TextOverflow.clip,
              fontSize: 13,
              color: AppColors.grey400,
              fontWeight: FontWeight.w500,
            ),
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          // textAlign: TextAlign.center,
        ).pOnly(top: 30, left: 10, right: 10, bottom: 20),
      ],
    );
  }
}
