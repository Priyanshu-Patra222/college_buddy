import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePagePrimaryIcons extends StatelessWidget {
  const HomePagePrimaryIcons({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  overflow: TextOverflow.clip,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).pOnly(top: 10),
            ),
            Expanded(flex: 2, child: Image.asset(icon, height: 80)),
            Expanded(
              flex: 1,
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  size: 25,
                ),
              ).pOnly(bottom: 10, right: 10),
            ),
          ],
        ),
      ),
    );
  }
}
