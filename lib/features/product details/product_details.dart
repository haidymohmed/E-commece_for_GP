import 'package:ecommerce/core/dialogs/AppToast.dart';
import 'package:ecommerce/features/card/domain/card_display/card_cubit.dart';
import 'package:ecommerce/features/card/domain/card_display/card_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controller/card.dart';
import '../../core/constant/color.dart';
import '../../core/functions/CustomerTheme.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/product.dart';
import '../../view/wedget/customer_button.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  late Product product ;
  ProductDetails({Key? key , required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.335,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  widget.product.image
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap : (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 18.sp,
                                    color: AppColor.white,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                    },
                                    child: Center(
                                      child:  Icon(
                                        Icons.favorite ,
                                        color: Colors.red,
                                        size: UserResponsive.get(
                                            context: context,
                                            mobile: 20.sp,
                                            tablet: 13.sp
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container(),)
                        ],
                      )
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 14.sp,
                          right: 14.sp,
                          left: 14.sp
                      ),
                      child: Text(
                        widget.product.name.toString(),
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 14.sp
                    ),
                    child: Text(
                        widget.product.description.toString(),
                        style: UserTheme.get(
                            context : context,
                            fontWight: FontWeight.w400,
                            fontSize: 12.sp,
                            colorBright: AppColor.black,
                            colorDark: AppColor.white
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet:  Padding(
          padding: const EdgeInsets.symmetric(
            // ignore: prefer_const_constructors, prefer_const_constructors
            vertical: 15
          ),
          child: BlocListener<CardCubit , CardStatus>(
            listener: (context , status){
              if(status is CardAddedSuccessfully){
                showToastError(
                  msg: "Product Added Successfully",
                  state: ToastedStates.SUCCESS
                );
              }else if( status is CardProcessFailed){
                showToastError(
                    msg: status.error.toString(),
                    state: ToastedStates.ERROR
                );
              }
            },
            child: UserButton(
                title: "Add (1) To Card - ${widget.product.price.toString()} Egp",
                color: AppColor.primaryColor,
                method: () async{
                  Provider.of<CardTest>(context , listen: false).addProduct(widget.product) ;
                }
            ),
          ),
        ),
      )
    );
  }
  getSideList({title, checked, method}){
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.sp
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic
            ),
          ),
          Checkbox(
            value: checked,
            activeColor: Colors.green,
            onChanged: method,
          )
        ],
      ),
    );
  }
  getPro({required title, required rate }) {
    return Column(
      children: [
        Container(
          height: UserResponsive.width(context) * 0.18,
          width: UserResponsive.width(context) * 0.18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33.sp),
              color: AppColor.primaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: (UserResponsive.width(context) * 0.08),
                backgroundColor: AppColor.white,
                child: Text(
                  rate.toString(),
                  style: UserTheme.get(
                      context: context,
                      fontWight: FontWeight.w600,
                      fontSize: 15.sp,
                      colorBright: AppColor.black,
                      colorDark: AppColor.black
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 6.sp,),
        Text(
          title,
          style: UserTheme.get(
              context: context,
              fontWight: FontWeight.w600,
              fontSize: 12.sp,
              colorBright: AppColor.black,
              colorDark: AppColor.white
          ),
        )
      ],
    );
  }
}
