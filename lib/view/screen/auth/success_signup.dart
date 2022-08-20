import 'package:ecommerce/controller/auth/successsignup_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/wedget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/wedget/languge/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  size: 200,
                  color: AppColor.primaryColor,
                ),
              ),
              Text("37".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 30)),
              CustomTextBodyAuth(
                text: "38".tr,
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                child: CustomButtomAuth(
                  text: "31".tr,
                  onPressed: () {
                    controller.goTologinPage();
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
