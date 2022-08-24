import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../category screen/domain/category_products_cubit.dart';
import '../category screen/domain/category_products_status.dart';
import '../products/domain/products_cubit.dart';
import '../products/products_screen.dart';
import 'domin/categories/category_status.dart';
import 'package:provider/provider.dart';
import '../../../controller/favorite.dart';
import 'domin/categories/category_cubit.dart';
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
            DisplayProductsCubit.get(context).getBestSeller(descending: true);
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsScreen(
              title: LocaleKeys.bestSeller.tr(),
              filter: (){
                if(DisplayProductsCubit.get(context).descending){
                  DisplayProductsCubit.get(context).getNewArrivals(descending: false);
                  setState(() {
                    DisplayProductsCubit.get(context).descending = false ;
                  });
                }else{
                  DisplayProductsCubit.get(context).getBestSeller(descending: false);
                  setState(() {
                    DisplayProductsCubit.get(context).descending = true ;
                  });
                }
              },
            )));
          },
        ),
        BlocBuilder<CategoryScreenUseCase , CategoriesScreenState>(
          builder: (context , status){
            if(status is ProductsCategoryFilterSuccessfully){
              return Container(
                  width: MediaQuery.of(context).size.width ,
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductWidgetHome(product: status.products[0]),
                      ),
                      Expanded(
                        child: ProductWidgetHome(product: status.products[1]),
                      ),
                    ],
                  )
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
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
                        "All you need is \nhere",

                        style: UserTheme.get(
                            context: context,
                            fontSize: UserResponsive.get(
                                context: context,
                                mobile: 16.sp,
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
                          "View All",
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
          onTap: ()async{
            await DisplayProductsCubit.get(context).getNewArrivals(descending: true);
            // ignore: use_build_context_synchronously
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsScreen(
              title: LocaleKeys.newArrival.tr(),
              filter: (){
                if(DisplayProductsCubit.get(context).descending){
                  DisplayProductsCubit.get(context).getNewArrivals(descending: false);
                  setState(() {
                    DisplayProductsCubit.get(context).descending = false ;
                  });
                }else{
                  DisplayProductsCubit.get(context).getNewArrivals(descending: false);
                  setState(() {
                    DisplayProductsCubit.get(context).descending = true ;
                  });
                }
              },
            )));
          },
        ),

        BlocBuilder<CategoryScreenUseCase , CategoriesScreenState>(
          builder: (context , status){
            if(status is ProductsCategoryFilterSuccessfully){
              return Container(
                  width: MediaQuery.of(context).size.width ,
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductWidgetHome(product: status.products[0]),
                      ),
                      Expanded(
                        child: ProductWidgetHome(product: status.products[1]),
                      ),
                    ],
                  )
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
