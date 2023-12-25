import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageBodyHeader extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  const HomePageBodyHeader({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  @override
  Widget build(BuildContext context) {
    return HomeSecondaryIconRow(title1: title1, title2: title2, title3: title3);
  }
}

class HomeSecondaryIconRow extends StatelessWidget {
  const HomeSecondaryIconRow({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            HomePageSecondaryIcon(
              onTap: () {
                context.navigateTo(const NotesRoute());
              },
              icon: Icons.book,
            ).h(80).w(80),
            Text(
              title1,
              style: const TextStyle(
                // fontFamily: GoogleFonts.poppins().fontFamily,
                overflow: TextOverflow.clip,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ).pOnly(top: 5),
          ],
        ),
        Column(
          children: [
            HomePageSecondaryIcon(
              onTap: () {
                // context.navigateTo(const NoticeRoute());
                context.navigateTo(const SplashRoute());
              },
              icon: Icons.assignment,
            ).h(80).w(80),
            Text(
              title2,
              style: const TextStyle(
                // // fontFamily: GoogleFonts.poppins().fontFamily,
                overflow: TextOverflow.clip,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ).pOnly(top: 5),
          ],
        ),
        Column(
          children: [
            HomePageSecondaryIcon(
              onTap: () {
                context.navigateTo(const AssignmentRoute());
              },
              icon: Icons.library_books,
            ).h(80).w(80),
            Text(
              title3,
              style: const TextStyle(
                // // fontFamily: GoogleFonts.poppins().fontFamily,
                overflow: TextOverflow.clip,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ).pOnly(top: 5),
          ],
        ),
      ],
    );
  }
}

class HomePageSecondaryIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const HomePageSecondaryIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: Border.all(
            // color: const Color(0xff6C63FF),
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          size: 40,
          color: AppColors.kSecondaryThemeColor.withOpacity(0.9),
        ),
      ),
    );
  }
}
