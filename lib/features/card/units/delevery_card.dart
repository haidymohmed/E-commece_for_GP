part of '../card.dart';

class DeleveryCard extends StatelessWidget {
  const DeleveryCard({Key? key}) : super(key: key);

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
      height: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ignore: prefer_const_constructors
          Text(
            "FREE\nDelivery",
            textAlign: TextAlign.center,
            style: UserTheme.get(
                context: context,
                fontSize: UserResponsive.get(context: context, mobile: 15.sp, tablet: 10.sp),
                fontWight: FontWeight.w600,
                colorBright: AppColor.primaryColor,
                colorDark: AppColor.primaryColor
            ),
          ),
          Image.asset(
              AppImageAsset.delevery.toString()
          )
        ],
      ),
    );
  }
}
