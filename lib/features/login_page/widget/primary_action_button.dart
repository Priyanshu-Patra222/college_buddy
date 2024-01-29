import 'package:college_buddy/const/color/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryActionButton extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;
  const PrimaryActionButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CupertinoActivityIndicator()
        : FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.kSecondaryThemeColor,
              elevation: 1.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              labelText,
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 15,
                  color: Colors.white),
            ),
          );
  }
}
