import 'package:ecommerce/controller/onboarding_controllar.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/wedget/onboarding/custombutton.dart';
import 'package:ecommerce/view/wedget/onboarding/customslider.dart';
import 'package:ecommerce/view/wedget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomdotConreollerOnBoarding(),
                    Spacer(flex: 1),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
