import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/features/examrecords/const/result_keys.dart';
import 'package:college_buddy/shared/custom_widgets/custom_text_formfield.dart';
import 'package:college_buddy/shared/custom_widgets/drop_down_button_field.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExamView();
  }
}

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M A R K   H I S T O R Y",
            style: TextStyle(
                color: Colors.black,
                // fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                R.ASSETS_ILLUSTRATIONS_MARK_HISTORY_PNG,
                height: 200,
              ),
              const DropDownButtonField(
                name: ResultKeys.semester,
                hintText: 'Select Your Semester',
                dropDownItem: ResultKeys.semesterList,
              ).pOnly(left: 20, right: 20),
              const DropDownButtonField(
                name: ResultKeys.branch,
                hintText: 'Select Your Branch',
                dropDownItem: ResultKeys.branchList,
              ).pOnly(top: 10, left: 20, right: 20),
              const CustomTextFormField(
                      hintText: 'Your Registration Number', name: ResultKeys.registrationumber)
                  .pOnly(top: 10, left: 20, right: 20),
              const CustomTextFormField(hintText: 'Your Roll Number', name: ResultKeys.rollno)
                  .pOnly(top: 10, left: 20, right: 20, bottom: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6C63FF),
                  // maximumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Get Yours'.toUpperCase(),
                      style: const TextStyle(
                        // fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              const CustomTextFormField(hintText: 'Here you go..', name: ResultKeys.result)
                  .pOnly(top: 5, left: 20, right: 20),
            ],
          ).p(10),
        ),
      ),
    );
  }
}
