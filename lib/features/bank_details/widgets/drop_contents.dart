import 'package:college_buddy/const/color/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class DropdownContent extends StatelessWidget {
  const DropdownContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Semester - 1",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Semester - 2",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Fees : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Total Fees : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Paid : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Total Paid : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: AppColors.grey500,
                thickness: 1,
                // height: 8,
                indent: 50,
                endIndent: 50,
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.grey500,
                thickness: 1,
                // height: 8,
                indent: 50,
                endIndent: 50,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total Due : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Total Due : INR _ _ _ ",
              style: GoogleFonts.poppins(
                  color: AppColors.grey700,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ).pOnly(bottom: 5),
      ],
    );
  }
}


