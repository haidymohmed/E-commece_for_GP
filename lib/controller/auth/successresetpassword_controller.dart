import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goTologinPage();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goTologinPage() {
    Get.offAllNamed(Approutes.login);
  }
}
