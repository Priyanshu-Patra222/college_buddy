import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/bank_details/controller/bank_details_pod.dart';
import 'package:college_buddy/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class BankDetailsPage extends StatelessWidget {
  const BankDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BANK DETAILS",
          style: TextStyle(
            letterSpacing: 3,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final studentId = ref.watch(loginDbProvider).getLoginModel()?.student.id;
            final bankDetailsAsync = ref.watch(bankDetailsProvider(studentId!));
            return bankDetailsAsync.easyWhen(
              data: (bankDetailsModel) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Account Holder:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        5.heightBox,
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Priyanshu Patra",
                            style: TextStyle(
                              color: AppColors.grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ).px16();
                  },
                );
              },
              loadingWidget: () => const CupertinoActivityIndicator(),
            );
          },
        ),
      ),
    );
  }
}

const listOfData = [
  "Account Holder:",
  "Account Number:",
  "Bank Name:",
  "IFSC Code:",
  "Student Email:",
  "Student D.O.B:",
  "Student Registration Number:",
  "Roll Number:",
  "Phone Number:",
];
