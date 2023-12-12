import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/features/library/const/library_keys.dart';
import 'package:college_buddy/shared/custom_widgets/custom_text_formfield.dart';
import 'package:college_buddy/shared/custom_widgets/drop_down_button_field.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LibraryView();
  }
}

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("L I B R A R Y",
            style: TextStyle(
                // fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                R.ASSETS_ILLUSTRATIONS_BOOK_SHELVES_PNG,
                height: 250,
              ),
              const CustomTextFormField(
                      hintText: 'Date Of Book issue ', name: LibraryKeys.dateOfIssue)
                  .pOnly(
                left: 15,
                right: 15,
              ),
              const CustomTextFormField(
                      hintText: 'Date Of Book return ', name: LibraryKeys.dateOfReturn)
                  .pOnly(left: 15, right: 15, top: 10),
              const CustomTextFormField(
                      hintText: 'Total Number Of Books', name: LibraryKeys.quantityOfBooks)
                  .pOnly(left: 15, right: 15, top: 10),
              const DropDownButtonField(
                name: LibraryKeys.booksName,
                hintText: 'Select Your Semester',
                dropDownItem: LibraryKeys.bookList,
              ).pOnly(left: 15, right: 15, top: 10),
            ],
          ).pOnly(left: 10, right: 10),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          requestBooksForm();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff6C63FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Request books !!',
          style: TextStyle(
            // fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void requestBooksForm() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.blue,
            surfaceTintColor: Colors.white,
            title: const Center(
              child: Text(
                'Request Books',
                style: TextStyle(
                  // fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextFormField(
                  hintText: 'Date',
                  name: LibraryKeys.dateOfIssue,
                ).pOnly(bottom: 8),
                const CustomTextFormField(
                  hintText: 'Total Number Of Books',
                  name: LibraryKeys.quantityOfBooks,
                ).pOnly(bottom: 8),
                const DropDownButtonField(
                  name: LibraryKeys.booksName,
                  hintText: 'Select Your Semester',
                  dropDownItem: LibraryKeys.bookList,
                ).pOnly(bottom: 8),
              ],
              // color: Colors.white,
              // child: ,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // booksForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const WidthBox(12),
              ElevatedButton(
                onPressed: () {
                  // booksForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Raise Request',
                  style: TextStyle(
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
