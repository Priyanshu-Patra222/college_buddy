import 'package:auto_route/auto_route.dart';
import 'package:college_buddy/core/router/router.gr.dart';
import 'package:college_buddy/data/service/login_db/login_db_service.dart';

class LoginGuard extends AutoRouteGuard {
  final LoginDbService loginDbService;

  LoginGuard({required this.loginDbService});

  @override

  /// A class that provides database services for token management.
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final studentId = loginDbService.getLoginModel()?.student.id;
    if (studentId != null) {
      resolver.next(true);
    } else {
      router.replaceAll([const LoginRoute()]);
      resolver.next(false);
    }
    // switch (authState) {
    //   case LoggedInState():
    //     resolver.next(true);
    //     break;
    //   case LoggedOutState():
    //     router.replaceAll([const LoginBaseRoute()]);
    //     resolver.next(false);
    //     break;
    //   case JwtExpiredState():
    //     router.replaceAll([const LoginBaseRoute()]);
    //     resolver.next(false);
    //     break;
    // }
  }
}

class LoginBaseRoute {
  const LoginBaseRoute();
}
