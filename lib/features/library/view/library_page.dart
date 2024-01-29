import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/library/const/library_keys.dart';
import 'package:college_buddy/features/library/controller/library_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:college_buddy/shared/widget/custom_text_formfield.dart';
import 'package:college_buddy/shared/widget/drop_down_button_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
        title: const Text(
          "LIBRARY",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(R.ASSETS_ILLUSTRATIONS_BOOK_SHELVES_PNG, height: 150)
                  .objectCenter(),
              Consumer(
                builder: (context, ref, child) {
                  final studentId =
                      ref.watch(loginDbProvider).getLoginModel()?.student.id;
                  final libraryAsync = ref.watch(libraryProvider(studentId!));
                  return libraryAsync.easyWhen(
                    data: (libraryModel) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 1.0,
                          mainAxisExtent: 150,
                        ),
                        itemCount:
                            libraryModel.libraryDetails!.booksBorrowed!.length,
                        itemBuilder: (context, index) {
                          // final totalAttendanceLength = attendanceModel.attendanceDetails.attendance?.length;
                          final eachBook = libraryModel
                              .libraryDetails!.booksBorrowed![index];
                          return Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Due date: ${DateFormat.yMMMEd().format(eachBook.dueDate!)}",
                                    style: const TextStyle(

                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.grey400,
                                  thickness: 1,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    eachBook.bookTitle.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    loadingWidget: () => const CupertinoActivityIndicator(),
                  );
                },
              ),
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
        child: Text(
          'Request books !!',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
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
            title:  Center(
              child: Text(
                'Request Books',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
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
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
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
                child: Text(
                  'Raise Request',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
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
