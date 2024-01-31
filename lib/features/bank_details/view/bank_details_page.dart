import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/data/service/login_db/login_db_service_pod.dart';
import 'package:college_buddy/features/bank_details/controller/bank_details_pod.dart';
import 'package:college_buddy/features/bank_details/widgets/list_of_content.dart';
import 'package:college_buddy/features/bank_details/widgets/year_wise_cards.dart';
import 'package:college_buddy/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
          leading: IconButton(
              onPressed: () {
                context.popRoute();
              },
              icon: const Icon(
                Icons.arrow_back,
              ))),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final studentId =
                ref.watch(loginDbProvider).getLoginModel()?.student.id;
            final bankDetailsAsync = ref.watch(bankDetailsProvider(studentId!));
            return bankDetailsAsync.easyWhen(
              data: (bankDetailsModel) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ListOfContent(
                          titleTxt: 'Account Holder : ',
                          titleContent: '',
                        ),
                        const ListOfContent(
                          titleTxt: 'Account Number : ',
                          titleContent: '',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: const ListOfContent(
                                titleTxt: 'Bank Name : ',
                                titleContent: '',
                              ).pOnly(right: 3),
                            ),
                            Expanded(
                                child: const ListOfContent(
                              titleTxt: 'IFSC Code :',
                              titleContent: '',
                            ).pOnly(left: 3)),
                          ],
                        ),
                        const ListOfContent(
                          titleTxt: 'Email : ',
                          titleContent: '',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: const ListOfContent(
                                titleTxt: 'Regd. Number : ',
                                titleContent: '',
                              ).pOnly(right: 3),
                            ),
                            Expanded(
                              child: const ListOfContent(
                                titleTxt: 'Roll Number : ',
                                titleContent: '',
                              ).pOnly(left: 3),
                            ),
                          ],
                        ),
                        const ListOfContent(
                          titleTxt: 'Phone Number :',
                          titleContent: '',
                        ),
                        Text(
                          "Get Your All Payment Details Below..",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        5.heightBox,
                        const YearWiseCard(
                          yearTxt: 'Year 1',
                        ),
                        const YearWiseCard(
                          yearTxt: 'Year 2',
                        ),
                        const YearWiseCard(
                          yearTxt: 'Year 3',
                        ),
                        const YearWiseCard(
                          yearTxt: 'Year 4',
                        ),
                      ],
                    ).px16();
                  },
                );
              },
              loadingWidget: () =>
                  const Center(child: CupertinoActivityIndicator()),
            );
          },
        ),
      ),
    );
  }
}
