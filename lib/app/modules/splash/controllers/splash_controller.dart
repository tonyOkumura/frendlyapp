import 'package:frendlyapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(Routes.HOME),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
