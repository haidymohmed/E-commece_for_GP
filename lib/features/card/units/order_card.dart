part of '../card.dart';
class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade900 : AppColor.white,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: UserResponsive.get(context: context, mobile: 15.sp, tablet: 10.sp)
      ),
      padding: EdgeInsets.all(5.sp),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: UserResponsive.get(context: context, mobile: 10.sp, tablet: 5.sp),
                    vertical: UserResponsive.get(context: context, mobile: 10.sp, tablet: 5.sp)
                ),
                child: Text(
                  "Your Order",
                  style: UserTheme.get(
                      context: context,
                      fontSize: UserResponsive.get(context: context, mobile: 15.sp, tablet: 10.sp),
                      fontWight: FontWeight.w600,
                      colorBright: AppColor.black,
                      colorDark: AppColor.white
                  ),
                )
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: Provider.of<CardTest>(context).products.length * 100,
            width: MediaQuery.of(context).size.width,
            child:  ListView.builder(
              itemCount: Provider.of<CardTest>(context).products.length,
              itemBuilder: (context , index){
                return OrderItemWidget( product: Provider.of<CardTest>(context).products[index],) ;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: UserResponsive.get(context: context, mobile: 20.sp, tablet: 5.sp),
                left: UserResponsive.get(context: context, mobile: 5.sp, tablet: 5.sp),
                bottom: UserResponsive.get(context: context, mobile: 2.sp, tablet: 2.sp),
                right: UserResponsive.get(context: context, mobile: 5.sp, tablet: 5.sp)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: UserTheme.get(
                      context: context,
                      fontSize: 15.sp,
                      fontWight: FontWeight.w700,
                      colorBright: AppColor.black,
                      colorDark: AppColor.white
                  ),
                ),
                Text(
                  "${Provider.of<CardTest>(context).total} EGP",
                  style: UserTheme.get(
                      context: context,
                      fontSize: 15.sp,
                      fontWight: FontWeight.w700,
                      colorBright: AppColor.black,
                      colorDark: AppColor.white
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
