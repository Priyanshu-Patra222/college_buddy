import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownButtonField extends StatefulWidget {
  final String name;
  final String? initialValue;
  final String hintText;
  final List<String> dropDownItem;
  final Widget? prefixIcon;
  const DropDownButtonField({
    Key? key,
    required this.name,
    this.initialValue,
    required this.hintText,
    required this.dropDownItem,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<DropDownButtonField> createState() => _DropDownButtonFieldState();
}

class _DropDownButtonFieldState extends State<DropDownButtonField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      isExpanded: false,
      name: widget.name,
      initialValue: widget.initialValue,
      validator: FormBuilderValidators.required(),
      alignment: Alignment.centerLeft,
      items: widget.dropDownItem
          .map(
            (e) => DropdownMenuItem(
                value: e,
                alignment: Alignment.center,
                child: Text(
                  e,
                  style: const TextStyle(color: Colors.black),
                )),
          )
          .toList(),
      onChanged: (value) {},
      style: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.grey.shade500,
        fontWeight: FontWeight.bold,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        size: 30,
        color: Colors.grey,
      ),
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.ubuntu(
          fontSize: 16,
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: widget.prefixIcon,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
