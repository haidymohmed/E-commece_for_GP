import 'package:ecommerce/controller/favorite.dart';
import 'package:ecommerce/features/favorite/units/profuct_card_fav.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../controller/DarkTheme.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../data/model/product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Product product = Product(
      id: "0",
      name: "Tablet",
      description: "Nokia T20 Android 11 4G Tablet with 10.36 Inch, 4GB RAM/64GB ROM, 8200mAh Battery, 8MP + 5MP Camera, Stereo Speaker, Dual Microphone, Metal Housing - Ocean Blue + Free Cover and Screen protector ",
      image: AppImageAsset.networkTestImage,
      price: 120,
      discount: 12,
      isFav: true,
      brand: "SAMSUNG", categoryId: ''
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              color:  Provider.of<UserDarkTheme>(context).isDark
                  ? null
                  : AppColor.background,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: Provider.of<FavoriteTest>(context).products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.83),
                        itemBuilder: (_, index) {
                          return ProductCardFav(product: Provider.of<FavoriteTest>(context).products[index]);
                        }
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
