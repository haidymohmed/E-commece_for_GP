import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/features/orders/units/order_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controller/DarkTheme.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../view/wedget/custom_appbar.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Provider.of<UserDarkTheme>(context).isDark? null  : AppColor.background,
          body: Column(
            children: [
              OrderAppBar(),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 400,
                    itemBuilder: (_ , index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.width * (3/8)),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.sp,
                            horizontal: 10.sp
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return  Image.asset(
                                        AppImageAsset.networkTestImage,
                                        fit: BoxFit.fill,
                                        width: constraints.maxWidth,
                                        height: constraints.maxHeight,
                                      );
                                    }
                                )
                            ),
                            Expanded(
                                flex: 5,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return  Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.sp,
                                        ),
                                        color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade800  : AppColor.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "OPPO A96",
                                                        style: UserTheme.get(
                                                            context: context,
                                                            fontSize: 15.sp,
                                                            fontWight: FontWeight.w700,
                                                            colorBright: AppColor.black,
                                                            colorDark: AppColor.white
                                                        ),
                                                      ),
                                                      Text(
                                                        "delivered",
                                                        style:  UserTheme.get(
                                                            context: context,
                                                            fontSize: 12.sp,
                                                            fontWight: FontWeight.w700,
                                                            colorBright: AppColor.primaryColor,
                                                            colorDark: AppColor.primaryColor
                                                        ),
                                                      ),
                                                      Text(
                                                        "15/8 03:20",
                                                        style: UserTheme.get(
                                                            context: context,
                                                            fontSize: 12.sp,
                                                            fontWight: FontWeight.w700,
                                                            colorBright: AppColor.grey,
                                                            colorDark: AppColor.grey
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: (){

                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: AppColor.grey,
                                                    )
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: (){

                                                  },
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: (){},
                                                          icon: Icon(
                                                            Icons.refresh,
                                                            color: AppColor.primaryColor,
                                                          )
                                                      ),
                                                      Text(
                                                        "Re-order",
                                                        style: UserTheme.get(
                                                            context: context,
                                                            fontSize: 14.sp,
                                                            fontWight: FontWeight.w800,
                                                            colorBright: AppColor.primaryColor,
                                                            colorDark: AppColor.primaryColor
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                )
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
