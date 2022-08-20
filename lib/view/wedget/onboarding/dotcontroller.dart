import 'package:ecommerce/controller/onboarding_controllar.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomdotConreollerOnBoarding extends StatelessWidget {
  const CustomdotConreollerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
