import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../features/category screen/domain/category_products_cubit.dart';
import 'CustomerTheme.dart';

class FilterWidget extends StatelessWidget {
  var onTap ;
  String text;
  FilterWidget({Key? key , required this.onTap , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.sp),
            child: const Icon(
              Icons.filter_list_sharp
            ),
          ),
          Text(
            "Filter",
            style: UserTheme.get(
                context: context, 
                fontSize: 13.sp,
                fontWight: FontWeight.bold, 
                colorBright: AppColor.black, 
                colorDark: AppColor.white
            ),
          ),
          // ignore: prefer_const_constructors
          Spacer(),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                  child: Image.asset(
                      AppImageAsset.filterPrice,
                    width: 14.sp,
                    height: 14.sp,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                  child: Text(
                    "Price : $text",
                    style: UserTheme.get(
                        context: context,
                        fontSize: 12.sp,
                        fontWight: FontWeight.w400,
                        colorBright: AppColor.black,
                        colorDark: AppColor.white
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
