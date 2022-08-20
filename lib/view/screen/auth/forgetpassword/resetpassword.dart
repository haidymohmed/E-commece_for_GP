import 'package:ecommerce/controller/auth/resetpassword_controoler.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/wedget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextformauth.dart';
import 'package:ecommerce/view/wedget/languge/customtextbodyauth.dart';
import 'package:ecommerce/view/wedget/auth/customtexttitel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validator.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitelAuth(text: "35".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 15),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controoler) => CustomTextFormAuth(
                obscuerText: controoler.isShowPassword,
                onTapIcon: () {
                  controoler.showPassword();
                },
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controoler.password,
                hinttext: "13".tr,
                iconData: Icons.lock_outlined,
                labeltext: "19".tr,
              ),
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controoler) => CustomTextFormAuth(
                obscuerText: controoler.isShowPassword,
                onTapIcon: () {
                  controoler.showPassword();
                },
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controoler.password,
                hinttext: "13".tr,
                iconData: Icons.lock_outlined,
                labeltext: "19".tr,
              ),
            ),
            CustomButtomAuth(
                text: "33".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
