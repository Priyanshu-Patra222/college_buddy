import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  deferredLoading: true,
)
class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a 3-second delay using Future.delayed
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            // You can replace CircularProgressIndicator with any loader widget you prefer
            child: CircularProgressIndicator(),
          )
        : AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              NoticeRoute(),
              AccountRoute(),
            ],
            bottomNavigationBuilder: (context, tabsRouter) {
              return NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                indicatorColor: AppColors.kSecondaryThemeColor.withOpacity(0.5),
                destinations: [
                  NavigationDestination(
                    icon: SvgPicture.asset(R.ASSETS_ICONS_HOME_SVG, height: 20),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon:
                        SvgPicture.asset(R.ASSETS_ICONS_NOTICE_SVG, height: 20),
                    label: "Notice",
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(R.ASSETS_ICONS_BANK_SVG, height: 22),
                    label: "Bank",
                  ),
                ],
              );
            },
          );
  }
}
