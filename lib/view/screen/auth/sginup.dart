import 'package:ecommerce/controller/auth/signupcontrooler.dart';
import 'package:ecommerce/core/constant/color.dart';
import '../../../../core/functions/validator.dart';
import 'package:ecommerce/view/wedget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextformauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextsignuoorsignin.dart';
import 'package:ecommerce/view/wedget/languge/customtextbodyauth.dart';
import 'package:ecommerce/view/wedget/auth/customtexttitel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alertexitapp.dart';

class SginUp extends StatelessWidget {
  const SginUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: ((controller) => WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    CustomTextTitelAuth(
                      text: "10".tr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextBodyAuth(
                      text: "24".tr,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        valid:
                        {
                          return validInput(val!, 3, 20, "username");
                        }
                        ;
                      },
                      mycontroller: controller.username,
                      hinttext: "23".tr,
                      iconData: Icons.person_outline_outlined,
                      labeltext: "20".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        valid:
                        {
                          return validInput(val!, 5, 40, "email");
                        }
                        ;
                      },
                      mycontroller: controller.email,
                      hinttext: "12".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "18".tr,
                    ),
                    GetBuilder<SignUpControllerImp>(
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
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        valid:
                        {
                          return validInput(val!, 7, 11, "phone");
                        }
                        ;
                      },
                      mycontroller: controller.phone,
                      hinttext: "22".tr,
                      iconData: Icons.phone_iphone_outlined,
                      labeltext: "21".tr,
                    ),
                    CustomButtomAuth(
                      text: "17".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextSignUpOrSignIn(
                      textone: "25".tr,
                      texttwo: "15".tr,
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
