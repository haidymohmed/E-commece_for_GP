import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/Language/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/DarkTheme.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/CustomerTheme.dart';
import '../../../core/functions/user_responsive.dart';
class OrderAppBar extends StatelessWidget {
  const OrderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
          MediaQuery.of(context).size.width * 0.9 , UserResponsive.get(
          context: context,
          mobile: 20.sp,
          tablet: 80.sp
      )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 15.sp
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 5.sp,
            vertical: UserResponsive.get(context: context, mobile: 10.sp, tablet: 8.sp)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade800 :  Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_rounded,
              ),
            ),
            Text(
                LocaleKeys.myOrders.tr(),
                textAlign: TextAlign.center,
                style: UserTheme.get(
                    context: context,
                    fontSize: UserResponsive.get(
                        context: context,
                        mobile: 17.sp,
                        tablet: 12.sp
                    ),
                    fontWight: FontWeight.w700,
                    colorBright: AppColor.black,
                    colorDark: Colors.grey.shade300
                )
            ),
            SizedBox(width: 1,)
          ],
        ),
      ),
    );
  }
}
