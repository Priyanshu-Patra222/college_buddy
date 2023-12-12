import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/features/account_page/account_page.dart';
import 'package:college_buddy/features/homepage/home_page.dart';
import 'package:college_buddy/features/noticepage/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NavbarPage extends StatelessWidget {
  const NavbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavbarView();
  }
}

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  List screen = [
    const HomePage(),
    const NoticePage(),
    const AccountPage(),
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // double displayWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: PageView.builder(
        pageSnapping: false,
        itemCount: 1,
        itemBuilder: (context, index) {
          return screen[currentIndex];
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.grey.shade400,
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          height: 50,
          backgroundColor: Colors.white,
          // AppColors.kBottomSheetListColor.withOpacity(0.2),
          onDestinationSelected: (value) => setState(() {
            currentIndex = value;
          }),
          destinations: [
            NavigationDestination(icon: SvgPicture.asset(R.ASSETS_ICONS_HOME_SVG, height: 20), label: 'Home'),
            NavigationDestination(icon: SvgPicture.asset(R.ASSETS_ICONS_NOTICE_SVG, height: 20), label: 'Notice'),
            NavigationDestination(icon: SvgPicture.asset(R.ASSETS_ICONS_BANK_SVG, height: 22), label: 'Accounts'),
          ],
        ),
      ),
    );
  }
}
