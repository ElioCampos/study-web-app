import 'package:get/get.dart';

class GlobalController extends GetxController {
  final RxBool loggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
