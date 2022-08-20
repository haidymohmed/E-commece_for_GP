import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Language/locale_keys.g.dart';
import '../../core/dialogs/AppToast.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/category.dart';
import '../../data/model/product.dart';
import '../../view/wedget/product_card.dart';
import '../category screen/categories_view.dart';
import '../product details/product_details.dart';
part 'units/categories_list.dart';
part 'units/section_title.dart';
part 'units/category_widget.dart';
part 'units/product_home_widget.dart';
part 'units/home_swiper.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Product product = Product(
      id: "0",
      name: "Tablet",
      description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
      image: AppImageAsset.networkTestImage,
      price: 120,
      discount: 12,
      isFav: true,
      brand: "SAMSUNG"
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionTitle(
          title: LocaleKeys.category.tr(),
          isTrailing: false,
        ),
        CategoryList(),
        //Best Seller
        SectionTitle(
          title: LocaleKeys.bestSeller.tr(),
          isTrailing: true,
          trailing: LocaleKeys.seeMore.tr(),
          onTap: (){
          },
        ),
        Container(
            width: MediaQuery.of(context).size.width ,
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp)
            ),
            child: Row(
              children: [
                Expanded(
                  child: ProductWidgetHome(product: product),
                ),
                Expanded(
                  child: ProductWidgetHome(product: product),
                ),
              ],
            )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: UserResponsive.get(
              context: context,
              mobile: UserResponsive.height(context) * 0.2,
              tablet: UserResponsive.height(context) * 0.22
          ),
          margin: EdgeInsets.symmetric(
              horizontal: 10.sp,
              vertical: 5.sp
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColor.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex : 6,
                child: SizedBox(
                  height: UserResponsive.get(
                      context: context,
                      mobile: UserResponsive.height(context) * 0.2,
                      tablet: UserResponsive.height(context) * 0.22
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        LocaleKeys.healthFood.tr(),
                        style: UserTheme.get(
                            context: context,
                            fontSize: UserResponsive.get(
                                context: context,
                                mobile: 17.sp,
                                tablet: 15.sp
                            ),
                            fontWight: FontWeight.w900,
                            colorBright: AppColor.white,
                            colorDark: AppColor.white
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin : UserResponsive.get(
                            context: context,
                            mobile: EdgeInsets.all(6.sp),
                            tablet: EdgeInsets.symmetric(
                                horizontal: 20.sp
                            )
                        ),
                        padding : EdgeInsets.all(UserResponsive.get(
                            context: context,
                            mobile: 5.sp,
                            tablet: 3.sp
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Colors.black,
                        ),
                        child: Text(
                          LocaleKeys.viewOurMenu.tr(),
                          textAlign: TextAlign.center,
                          style: UserTheme.get(
                              context: context,
                              fontSize: UserResponsive.get(
                                  context: context,
                                  mobile: 13.sp,
                                  tablet: 10.sp
                              ),
                              fontWight: FontWeight.w600,
                              colorBright: AppColor.white,
                              colorDark: AppColor.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex : 4,
                child: SizedBox(
                  height: UserResponsive.get(
                      context: context,
                      mobile: UserResponsive.height(context) * 0.2,
                      tablet: UserResponsive.height(context) * 0.22
                  ),
                  child: Image.asset(
                    AppImageAsset.localeTestImage,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
        SectionTitle(
          title: LocaleKeys.newArrival.tr(),
          isTrailing: true,
          trailing: LocaleKeys.seeMore.tr(),
          onTap: (){
          },
        ),
        Container(
            width: MediaQuery.of(context).size.width ,
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp)
            ),
            child: Row(
              children: [
                Expanded(
                  child: ProductWidgetHome(product: product),
                ),
                Expanded(
                  child: ProductWidgetHome(product: product),
                ),
              ],
            )
        )
      ],
    );
  }
}
