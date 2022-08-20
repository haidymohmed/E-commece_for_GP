import 'package:ecommerce/controller/auth/forgetpassword_controller.dart';

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/wedget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextformauth.dart';

import 'package:ecommerce/view/wedget/languge/customtextbodyauth.dart';
import 'package:ecommerce/view/wedget/auth/customtexttitel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validator.dart';

class ForGetPassword extends StatelessWidget {
  const ForGetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForGetPasswordControllerImp controller =
        Get.put(ForGetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text('14'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                CustomTextTitelAuth(
                  text: "27".tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextBodyAuth(
                  text: "29".tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 50, "email");
                  },
                  mycontroller: controller.email,
                  hinttext: "12".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "18".tr,
                ),
                CustomButtomAuth(
                  text: "30".tr,
                  onPressed: () {
                    controller.goToVeryfiycode();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
