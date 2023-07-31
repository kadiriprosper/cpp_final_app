import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var tabIndex = [0].obs;

  void changeTabIndex(int index) {
    tabIndex.add(index);
  }

  void popTab() {
    if (tabIndex.length > 1) {
      tabIndex.removeLast();
    }
    if (tabIndex.last == 0 && tabIndex.length > 1) {
      tabIndex.removeRange(1, tabIndex.length - 1);
    }
  }
}
