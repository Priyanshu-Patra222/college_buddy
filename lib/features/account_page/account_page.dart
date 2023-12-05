import 'package:auto_route/annotations.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("P A Y M E N T S",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              R.ASSETS_ILLUSTRATIONS_ACCOUNTS_PAYMENTS_PNG,
            ).centered(),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, RoutesName.ourChefMasters);
                // context.navigateTo(const OurChefRoute());
                // ref.read(chefDbProvider).enableChefView();
                // log('ischef enabled: $isChefViewEnabled');
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
                    'Click to Authenticate'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.asset(
                      R.ASSETS_ICONS_CLICK_PNG,
                      color: Colors.white,
                    ).centered(),
                    // Icon(
                    //   Icons.arrow_forward_rounded,
                    //   color: Colors.white,
                    // ),
                  )
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //       backgroundColor:

            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(12.0),
            //               side: BorderSide(
            //                   color: Colors.grey.shade300, width: 0.2)))),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         R.ASSETS_ICONS_CLICK_PNG,
            //         height: 50,
            //       ),
            //       5.widthBox,
            //       const Text(
            //         "Click to authenticate",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18,
            //             fontWeight: FontWeight.w400),
            //       )
            //     ],
            //   ).centered(),
            // ).p12(),

            // TextField(
            //   autofocus: false,
            //   keyboardType: TextInputType.text,
            //   style: const TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
            //   decoration: InputDecoration(
            //     prefixIcon: const Icon(Icons.search),
            //     filled: true,
            //     fillColor: Colors.grey.shade200,
            //     hintText: 'Search your account details...',
            //     contentPadding:
            //         const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey.shade300),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //   ),
            //   // textAlign: TextAlign.center,
            // ).p12(),
          ],
        ).p12()));
  }
}
