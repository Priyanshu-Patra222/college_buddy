import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/core/router/guards/login_guard.dart';
import 'package:college_buddy/core/router/guards/splash_guard.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/data/service/login_db/login_db_service.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final LoginDbService loginDbService;

  AppRouter({super.navigatorKey, required this.loginDbService});

  @override
  late final List<AutoRoute> routes = [
    AdaptiveRoute(
      page: LoginRoute.page,
      path: '/',
      guards: [
        SplashGuard(loginDbService: loginDbService),
      ],
      initial: true,
    ),
    AdaptiveRoute(
      page: NavBarRoute.page,
      path: '/navbar',
      guards: [
        LoginGuard(loginDbService: loginDbService),
      ],
      children: [
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: NoticeRoute.page),
        AdaptiveRoute(page: AccountRoute.page),
      ],
    ),

    AdaptiveRoute(
      page: AttendanceRoute.page,
      path: '/attendance',
    ),
    AdaptiveRoute(
      page: ExamRoute.page,
      path: '/exam',
    ),
    AdaptiveRoute(
      page: LibraryRoute.page,
      path: '/library',
    ),
    AdaptiveRoute(page: AttendanceRoute.page, path: '/attendance'),
    AdaptiveRoute(page: StudyMaterialsRoute.page, path: '/study-materials'),
    AdaptiveRoute(page: AccountRoute.page, path: '/account'),
    AdaptiveRoute(page: NoticeRoute.page, path: '/notice'),
    AdaptiveRoute(page: NotesRoute.page, path: '/notes'),
    AdaptiveRoute(page: AssignmentRoute.page, path: '/assignment'),
    AdaptiveRoute(page: SplashRoute.page, path: '/splash'),
  ];
}
