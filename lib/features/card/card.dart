import 'package:ecommerce/controller/card.dart';
import 'package:ecommerce/controller/order.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/dialogs/AppToast.dart';
import 'package:ecommerce/features/card/domain/card_display/card_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/product.dart';
import '../../view/wedget/customer_button.dart';
import 'domain/card_display/card_cubit.dart';
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
          OrderCard(),
          SizedBox(height: 20.sp),
          UserButton(
            title: 'Place Order',
            method: (){
              setState(() {
                for(Product p in Provider.of<CardTest>(context , listen: false).products){
                  Provider.of<OrderTest>(context , listen: false).addProduct(p);
                  Provider.of<CardTest>(context , listen: false).deleteProduct(p);
                }
                showToastError(msg: "Order Placed Successfully", state: ToastedStates.SUCCESS);
              });
            },
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }

}
