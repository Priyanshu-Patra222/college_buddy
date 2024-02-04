import 'package:college_buddy/const/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfContent extends StatelessWidget {
  const ListOfContent({
    super.key,
    required this.titleTxt,
    required this.titleContent,
  });

  final String titleTxt;
  final String titleContent;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleTxt,
          style: GoogleFonts.poppins(
            fontSize: 15,
            // color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        3.heightBox,
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            border: Border.all(
              width: 0.5,
              color: Colors.grey.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            titleContent,
            style: GoogleFonts.poppins(
              color: AppColors.grey700,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ).h(60).pOnly(
              bottom: 12,
            ),
      ],
    );
  }
}
