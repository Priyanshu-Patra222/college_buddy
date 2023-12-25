import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/const/semesters/list_of_semesters.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/marksheet/controller/marksheet_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class MarksheetPage extends StatelessWidget {
  const MarksheetPage({Key? key}) : super(key: key);

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
        title: const Text(
          "MARK HISTORY",
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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                R.ASSETS_ILLUSTRATIONS_MARK_HISTORY_PNG,
                height: 150,
              ).objectCenter(),
              Consumer(
                builder: (context, ref, child) {
                  final studentId = ref.watch(loginDbProvider).getLoginModel()?.student.id;
                  final marksheetAsync = ref.watch(marksheetProvider(studentId!));
                  return marksheetAsync.when(
                    data: (marksheetModel) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: marksheetModel.marksheet!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final eachSemesterSubject = marksheetModel.marksheet![index];
                          return Card(
                            elevation: 4,
                            child: ExpansionTile(
                              title: Text(listOfSemesters[index]),
                              backgroundColor: AppColors.grey200,
                              collapsedBackgroundColor: AppColors.grey300,
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  primary: false,
                                  itemCount: marksheetModel.marksheet![index].subjects!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                          "Subjects: ${eachSemesterSubject.subjects![index].subjectName}"),
                                      subtitle: Text(
                                        "Grade: ${(eachSemesterSubject.subjects![index].grade)}",
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(
                                      color: AppColors.grey400,
                                      indent: 25,
                                      endIndent: 25,
                                      thickness: 1,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 12.heightBox;
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator().centered(),
                    error: (error, stackTrace) => Text(error.toString()).centered(),
                  );
                },
              ),
            ],
          ).px12(),
        ),
      ),
    );
  }
}
