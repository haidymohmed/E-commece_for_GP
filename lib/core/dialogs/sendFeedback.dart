import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controller/DarkTheme.dart';
import '../../core/functions/CustomerTheme.dart';
sendFeedBackDialog(context){
  return  WillPopScope(
    onWillPop: () async => true,
    child: AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.bottomCenter,
      actions: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 30.sp
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade800  : AppColor.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "+20 0111 938 9495",
                textAlign: TextAlign.center,
                style:  UserTheme.get(
                    context: context,
                    fontSize: 16.sp,
                    fontWight: FontWeight.w700,
                    colorBright: AppColor.primaryColor,
                    colorDark:  AppColor.primaryColor,
                ),
              ),
              const Divider(),
              getFeedbackItem(
                  title: "Send Message",
                  method: (){},
                  context : context
              ),
              const Divider(),
              getFeedbackItem(
                  title: "Start Voice Message",
                  method: (){},
                  context : context
              ),
            ],
          ),
        ),
        SizedBox(height: 10.sp,),
        const Divider(),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 5.sp,
              vertical: 5.sp
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade800  : AppColor.white
          ),
          child:
          getFeedbackItem(
              title: "Cancel",
              method: (){
                Navigator.pop(context);
              },
              context : context
          ),
        )
      ],
    ),
  );
}
getFeedbackItem({title , method , context}){
  return InkWell(
    onTap: method,
    child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Text(
          title,
          style: UserTheme.get(
              context: context,
              fontSize: 17.sp,
              fontWight: FontWeight.w600,
              colorBright: AppColor.primaryColor,
              colorDark:  AppColor.primaryColor,
          ),
        ),
      ),
    ),
  );
}