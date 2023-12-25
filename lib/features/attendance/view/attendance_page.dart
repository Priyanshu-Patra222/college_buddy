import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/attendance/controller/attendance_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        title: const Text(
          "ATTENDANCE",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
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
                height: 150,
              ).objectCenter(),
              Consumer(
                builder: (context, ref, child) {
                  final studentId = ref.watch(loginDbProvider).getLoginModel()?.student.id;
                  final attendanceAsync = ref.watch(attendanceProvider(studentId!));
                  return attendanceAsync.when(
                    data: (attendanceModel) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 1.0,
                          mainAxisExtent: 150,
                        ),
                        itemCount: attendanceModel.attendanceDetails.attendance?.length,
                        itemBuilder: (context, index) {
                          // final totalAttendanceLength = attendanceModel.attendanceDetails.attendance?.length;
                          final eachAttendance =
                              attendanceModel.attendanceDetails.attendance![index];
                          return Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppColors.grey300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    "${listOfSemesters[index]} Semester",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${eachAttendance.attendancePercentage.toString()}%",
                                    style: const TextStyle(
                                      fontSize: 50,
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
                    loading: () => const CircularProgressIndicator().centered(),
                    error: (error, stackTrace) => Text(error.toString()).centered(),
                  );
                },
              ),
            ],
          ).p(10),
        ),
      ),
    );
  }
}

const listOfSemesters = [
  "1st",
  "2nd",
  "3rd",
  "4th",
  "5th",
  "6th",
  "7th",
  "8th",
];
