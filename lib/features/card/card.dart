import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/product.dart';
import '../../view/wedget/customer_button.dart';
part 'units/order_title.dart';
part 'units/order_card.dart';
part 'units/order_item_widget.dart';
part 'units/delevery_card.dart';
class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int counter = 1 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const OrderTitle(),
          // ignore: prefer_const_constructors
          DeleveryCard(),
          SizedBox(height: 20.sp),
          const OrderCard(),
          SizedBox(height: 20.sp),
          UserButton(
            title: 'Place Order',
            method: (){
              Navigator.pushNamed(context, "addressInfoPath");
            },
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }

}
