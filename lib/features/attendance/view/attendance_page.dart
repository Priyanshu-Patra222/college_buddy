import 'package:auto_route/annotations.dart';
import 'package:college_buddy/bootstrap.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/features/attendance/const/attendance_keys.dart';
import 'package:college_buddy/shared/custom_widgets/custom_text_formfield.dart';
import 'package:college_buddy/shared/custom_widgets/drop_down_button_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AttendanceView();
  }
}

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("A T T E N D A N C E",
            style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  R.ASSETS_ILLUSTRATIONS_ATTENDANCE_HISTORY_PNG,
                  height: 200,
                ),
                const DropDownButtonField(
                  name: AttendanceKeys.semester,
                  hintText: 'Select Your Semester',
                  dropDownItem: AttendanceKeys.semesterList,
                ).pOnly(left: 20, right: 20),
                const DropDownButtonField(
                  name: AttendanceKeys.branch,
                  hintText: 'Select Your Branch',
                  dropDownItem: AttendanceKeys.branchList,
                ).pOnly(top: 10, left: 20, right: 20),
                const CustomTextFormField(
                        hintText: 'Your Registration Number',
                        name: AttendanceKeys.rollno)
                    .pOnly(top: 10, left: 20, right: 20),
                const CustomTextFormField(
                        hintText: 'Your Roll Number',
                        name: AttendanceKeys.registrationumber)
                    .pOnly(top: 10, left: 20, right: 20, bottom: 15),
                ElevatedButton(
                  onPressed: () {
                    talker.debug('dropdown1:${AttendanceKeys.semester}');
                  },
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
                const CustomTextFormField(
                        hintText: 'Here you go', name: AttendanceKeys.result)
                    .pOnly(top: 5, left: 20, right: 20),
              ],
            ).p(10),
          )),
    );
  }
}
