import 'package:badges/badges.dart';
import 'package:ecommerce/features/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Language/locale_keys.g.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/user_responsive.dart';
import '../../data/model/category.dart';
import '../../data/model/product.dart';
import '../../view/wedget/custom_appbar.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  late Category category;
  CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<Product> products = [
    Product(
      id: "0",
      name: "Tablet",
      description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
      image: AppImageAsset.networkTestImage,
      price: 120,
      discount: 12,
      isFav: true,
      brand: "SAMSUNG"
    ),
    Product(
        id: "0",
        name: "Tablet",
        description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
        image: AppImageAsset.networkTestImage,
        price: 120,
        discount: 12,
        isFav: true,
        brand: "SAMSUNG"
    ),
    Product(
        id: "0",
        name: "Tablet",
        description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
        image: AppImageAsset.networkTestImage,
        price: 120,
        discount: 12,
        isFav: true,
        brand: "SAMSUNG"
    ),
    Product(
      id: "0",
      name: "Tablet",
      description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
      image: AppImageAsset.networkTestImage,
      price: 120,
      discount: 12,
      isFav: true,
      brand: "SAMSUNG"
    ),
  ];
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
                Expanded(
                  child:  GridView.builder(
                      itemCount: products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.83
                      ),
                      itemBuilder: (context , index){
                        return ProductWidgetHome(product: products[index]);
                      }
                  )
                ),
              ]
          ),
        )
    );
  }
}
