import 'package:ecommerce/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class VerifyCodeSignupController extends GetxController {
  checkCode();
  goTosuccessSignUp();
}

class VerifyCodeSignupControllerImp extends VerifyCodeSignupController {
  late String verifycode;

  @override
  checkCode() {}

  @override
  goTosuccessSignUp() {
    Get.offNamed(Approutes.successSignUp);
  }
}
