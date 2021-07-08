import 'package:bravos_tix/features/dashboard/models/tab_option.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  var tabIndex = TabOption.HOME.obs;

  void changeTabIndex(TabOption tabOption){
    tabIndex.value = tabOption;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}