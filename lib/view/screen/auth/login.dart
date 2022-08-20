import 'package:ecommerce/controller/auth/logincontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/features/home/home.dart';
import '../../../../core/functions/validator.dart';
import 'package:ecommerce/view/wedget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextformauth.dart';
import 'package:ecommerce/view/wedget/auth/customtextsignuoorsignin.dart';
import 'package:ecommerce/view/wedget/auth/logoauth.dart';
import 'package:ecommerce/view/wedget/languge/customtextbodyauth.dart';
import 'package:ecommerce/view/wedget/auth/customtexttitel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alertexitapp.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controoler = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text('9'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: controoler.formstate,
              child: ListView(
                children: [
                  const LogoAuth(),
                  CustomTextTitelAuth(
                    text: "10".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBodyAuth(
                    text: "11".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    mycontroller: controoler.email,
                    hinttext: "12".tr,
                    iconData: Icons.email_outlined,
                    labeltext: "18".tr,
                  ),
                  GetBuilder<LoginControllerImp>(
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
                  InkWell(
                    onTap: (() {
                      controoler.goToForGetPassword();
                    }),
                    child: Text(
                      "14".tr,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  CustomButtomAuth(
                    text: "15".tr,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Home()) );
                      controoler.login();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextSignUpOrSignIn(
                    textone: "16".tr,
                    texttwo: "17".tr,
                    onTap: () {
                      controoler.goToSignUp();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
