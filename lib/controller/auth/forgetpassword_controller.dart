import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForGetPasswordController extends GetxController {
  checkEmsil();
  goToVeryfiycode();
}

class ForGetPasswordControllerImp extends ForGetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  checkEmsil() {}

  @override
  goToVeryfiycode() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(Approutes.verfiyCode);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
