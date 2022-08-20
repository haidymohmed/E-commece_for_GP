import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';

getSettingOption({required title, required icon, required islast, onTap ,required context}){
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          margin: UserResponsive.get(
              context: context,
              mobile: null,
              tablet: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 5.sp
              )
          ),
          child: ListTile(
            title: Text(
                title,
                style: UserTheme.get(
                    context: context,
                    fontSize: UserResponsive.get(
                        context: context,
                        mobile: 15.sp,
                        tablet: 10.sp
                    ),
                    fontWight: FontWeight.w600,
                    colorBright: AppColor.black,
                    colorDark: AppColor.white
                )
            ),
            trailing: icon.runtimeType == IconData? Icon(
              icon ,
              color: AppColor.primaryColor,
              size: UserResponsive.get(
                  context: context,
                  mobile: 15.sp,
                  tablet: 10.sp
              ),
            ) : icon ,
          ),
        ),
      ),
      islast ?   Container() : Divider(
        height: 5.sp,
        color: Colors.grey.shade300,
      ),
    ],
  );
}