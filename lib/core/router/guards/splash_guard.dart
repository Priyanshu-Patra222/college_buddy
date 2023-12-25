import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/data/service/login_db/login_db_service.dart';


class SplashGuard extends AutoRouteGuard {
  // final AuthState authState;
  final LoginDbService loginDbService;

  SplashGuard({required this.loginDbService});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final studentId = loginDbService.getLoginModel()?.student.id;
    if (studentId != null) {
      router.replaceAll([const NavBarRoute()]);
      resolver.next(false);
    } else {
      resolver.next(true);
    }
    // switch (authState) {
    //   case LoggedInState():
    //     router.replaceAll([const HomeRoute()]);
    //     resolver.next(false);
    //     break;
    //   case LoggedOutState():
    //     resolver.next(true);
    //     break;
    //   case JwtExpiredState():
    //     resolver.next(true);
    //     break;
    // }
  }
}
