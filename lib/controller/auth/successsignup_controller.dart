import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goTologinPage();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goTologinPage() {
    Get.offAllNamed(Approutes.login);
  }
}
