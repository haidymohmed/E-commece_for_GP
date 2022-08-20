part of '../card.dart';
class OrderTitle extends StatelessWidget {
  const OrderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 35.sp,
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
        child: Text(
          "Electronic devices",
          style: GoogleFonts.tajawal(
            fontSize: UserResponsive.get(context: context, mobile: 18.sp, tablet: 15.sp),
            fontWeight: FontWeight.w700,
          ),
        )
    );
  }
}
