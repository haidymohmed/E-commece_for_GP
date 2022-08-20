import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
class UserButton extends StatefulWidget {
  final Function method ;
  final Color color ;
  final String title ;

  const UserButton({Key? key, required this.title ,required this.color ,required this.method}) : super(key: key);

  @override
  _UserButtonState createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 5.sp,
          horizontal: 15.sp
      ),
      height: UserResponsive.get(
          context: context,
          mobile: 43.sp,
          tablet: 28.sp
      ),
      width: UserResponsive.get(
          context: context,
          mobile: UserResponsive.width(context) * 0.9,
          tablet: UserResponsive.width(context) * 0.6
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: widget.color,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color : widget.color == Colors.transparent ?  Colors.white : widget.color , width: 2) ,
                borderRadius: BorderRadius.circular(10),
              )
          ),
          onPressed: (){
            widget.method();
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: UserTheme.get(
                context: context,
                fontSize: UserResponsive.get(
                  context: context,
                  mobile: 14.sp,
                  tablet: 10.sp
                ),
                fontWight: FontWeight.w700,
                colorBright: AppColor.white,
                colorDark: AppColor.white
              ),
            ),
          )
      ),
    );
  }
}
