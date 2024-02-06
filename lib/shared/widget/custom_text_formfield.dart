import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    required this.name,
    this.textInputAction,
    this.onChanged,
    this.initialValue,
    this.isReadOnly = false,
    this.minLine,
    this.maxLine,
  });

  final Widget? prefixIcon;
  final bool isReadOnly;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String name;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final int? minLine;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      style: GoogleFonts.inter(
        fontSize: 15,
        // color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
        // fillColor: Colors.grey.withOpacity(1),
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
