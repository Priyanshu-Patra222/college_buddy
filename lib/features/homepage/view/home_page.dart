import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/const/color/app_colors.dart';
import 'package:college_buddy/const/resource.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/features/homepage/view/widgets/home_page_body_grid.dart';
import 'package:college_buddy/features/homepage/view/widgets/home_page_body_header.dart';
import 'package:college_buddy/features/homepage/view/widgets/home_page_header.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(deferredLoading: true)
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const HomePageHeader(),
              const HomePageBodyHeader(
                title1: 'Notes',
                title2: 'Notice',
                title3: 'Assignments',
              ),
              15.heightBox,
              const Divider(
                color: AppColors.grey300,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              15.heightBox,
              GridView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                children: [
                  HomePagePrimaryIcons(
                    title: 'Attendance',
                    icon: R.ASSETS_ILLUSTRATIONS_ATTENDANCE_PNG,
                    onTap: () => context.pushRoute(const AttendanceRoute()),
                  ),
                  HomePagePrimaryIcons(
                    title: 'Marksheet',
                    icon: R.ASSETS_ILLUSTRATIONS_EXAMRECORDS_PNG,
                    onTap: () => context.pushRoute(const MarksheetRoute()),
                  ),
                  HomePagePrimaryIcons(
                    title: 'Library',
                    icon: R.ASSETS_ILLUSTRATIONS_LIBRARY_PNG,
                    onTap: () => context.pushRoute(const LibraryRoute()),
                  ),
                  HomePagePrimaryIcons(
                    title: 'Study Materials',
                    icon: R.ASSETS_ILLUSTRATIONS_BOOKS_PILE_PNG,
                    onTap: () => context.pushRoute(const StudyMaterialsRoute()),
                  ),
                ],
              ),
            ],
          ).pOnly(left: 10, right: 10, top: 5),
        ),
      ),
    );
  }
}
