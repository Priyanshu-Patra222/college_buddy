import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/features/bank_details/widgets/drop_contents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearWiseCard extends StatelessWidget {
  const YearWiseCard({
    super.key,
    required this.yearTxt,
  });

  final String yearTxt;
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 0,
      color: AppColors.grey300,
      child: ExpansionTile(
        title: Text(
          yearTxt,
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        children: const [
          DropdownContent(),
        ],
      ),
    );
  }
}
