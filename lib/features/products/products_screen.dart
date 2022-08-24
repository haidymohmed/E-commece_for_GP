import 'package:ecommerce/features/products/domain/products_cubit.dart';
import 'package:ecommerce/features/products/domain/products_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/color.dart';
import '../../core/functions/filter_widget.dart';
import '../../core/functions/user_responsive.dart';
import '../../view/wedget/custom_appbar.dart';
import '../home/home_view.dart';

class ProductsScreen extends StatelessWidget {
  String title ;
  // ignore: prefer_typing_uninitialized_variables
  var filter ;
  ProductsScreen({Key? key , required this.title , required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
              children:[
                getAppBar(
                    context: context,
                    perffix: InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.arrow_back ,
                          color: Provider.of<UserDarkTheme>(context).isDark? Colors.grey.shade300 : Colors.black,
                          size: UserResponsive.get(
                              context: context,
                              mobile: 17.sp,
                              tablet: 13.sp
                          ),
                        )
                    ),
                    suffix: Container(width: 35,),
                    title: title
                ),
                FilterWidget(
                  text: DisplayProductsCubit.get(context).descending == true ?  "Highest to low" : "Lowest to high" ,
                  onTap: filter
                ),
                BlocBuilder<DisplayProductsCubit , ProductsStatus>(
                    builder: (context , status) {
                      if(status is DisplayProductsSuccessfully){
                        if(status.products.isNotEmpty){
                          return Expanded(
                              child:  GridView.builder(
                                  itemCount: status.products.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.83
                                  ),
                                  itemBuilder: (context , index){
                                    return ProductWidgetHome(product: status.products[index]);
                                  }
                              )
                          );
                        }
                        else{
                          Text("Empty");
                        }
                      }else if(status is DisplayProductsFailed){
                        Text(status.error.toString());
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    }
                ),
              ]
          ),
        )
    );
  }

}
