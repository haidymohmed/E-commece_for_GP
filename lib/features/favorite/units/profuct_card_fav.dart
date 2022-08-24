import 'package:badges/badges.dart';
import 'package:ecommerce/data/model/product.dart';
import 'package:ecommerce/view/wedget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/favorite.dart';
import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class ProductCardFav extends StatelessWidget {
  Product product ;
  ProductCardFav({Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: AppColor.background.withOpacity(0.6),
      position: const BadgePosition(top: 5, start: 5),
      elevation: 0,
      badgeContent: InkWell(
          onTap: () {
            Provider.of<FavoriteTest>(context , listen: false).deleteProduct(product);
          },
          child: const Center(
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          )
      ),
      child: ProductWidget(product: product),
    );
  }
}
