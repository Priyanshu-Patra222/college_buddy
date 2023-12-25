import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "ACCOUNTS",
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
                backgroundColor: AppColors.kSecondaryThemeColor,
                // maximumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      screenLock(
                        context: context,
                        correctString: '1234',
                        canCancel: false,
                        onUnlocked: () => context.navigateTo(const BankDetailsRoute()),
                      );
                    },
                    child: const Text(
                      'Click to Authenticate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
          ],
        ).p12()));
  }
}
