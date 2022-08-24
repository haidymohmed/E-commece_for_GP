import 'package:badges/badges.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Language/locale_keys.g.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/filter_widget.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/category.dart';
import '../../data/model/product.dart';
import '../../view/wedget/custom_appbar.dart';
import 'domain/category_products_cubit.dart';
import 'domain/category_products_status.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  late Category category;
  CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

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
                    title: widget.category.name
                ),
                FilterWidget(
                  text: CategoryScreenUseCase.get(context).descending == true ?  "Highest to low" : "Lowest to high" ,
                  onTap: (){
                    if(CategoryScreenUseCase.get(context).descending){
                      CategoryScreenUseCase.get(context).filterProductWithLowestPrice(id: widget.category.id);
                      setState(() {
                        CategoryScreenUseCase.get(context).descending = false ;
                      });
                    }else{
                      CategoryScreenUseCase.get(context).filterProductWithHighPrice(id: widget.category.id);
                      setState(() {
                        CategoryScreenUseCase.get(context).descending = true ;
                      });
                    }
                  },
                ),
                BlocBuilder<CategoryScreenUseCase , CategoriesScreenState>(
                  builder: (context , status) {
                    if(status is ProductsCategoryFilterSuccessfully){
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
                    }else if(status is ProductsCategoryFilterFailed){
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
