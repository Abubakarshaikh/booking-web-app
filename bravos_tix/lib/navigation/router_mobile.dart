import 'package:bravos_tix/features/dashboard/dashboard_screen.dart';
import 'package:bravos_tix/features/sign_in/sign_in_screen.dart';
import 'package:bravos_tix/features/splash/splash_screen.dart';
import 'package:get/get.dart';

const INIT_ROUTE = SignInScreen.routeName;

List<GetPage> router() {
  return [
    GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: SignInScreen.routeName,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: DashboardScreen.routeName,
      page: () => DashboardScreen(),
    ),
  ];
}
