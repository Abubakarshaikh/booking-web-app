import 'package:bravos_tix/features/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    Get.offAndToNamed(DashboardScreen.routeName);
  }
}