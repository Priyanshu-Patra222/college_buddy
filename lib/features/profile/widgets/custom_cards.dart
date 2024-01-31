import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomCards extends StatelessWidget {
  const CustomCards({
    super.key,
    required this.cardTxt,
    required this.icon,
    //  this.height,
  });
  // final double? height;
  final String cardTxt;
  // final String icon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(icon),
        // SvgPicture.asset(
        //   icon,
        //   // height: height,
        // ),
        tileColor: Colors.transparent,
        title: Text(
          cardTxt,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ).pOnly(bottom: 10);
  }
}
