import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  deferredLoading: true,
)
class NavBarPage extends StatelessWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        NoticeRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations:  [
            NavigationDestination(
              icon: SvgPicture.asset(R.ASSETS_ICONS_HOME_SVG, height: 20),
              label: "a",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(R.ASSETS_ICONS_NOTICE_SVG, height: 20),
              label: "b",
            ),
            NavigationDestination(
              icon: SvgPicture.asset(R.ASSETS_ICONS_BANK_SVG, height: 22),
              label: "c",
            ),
          ],
        );
      },
    );
  }
}

