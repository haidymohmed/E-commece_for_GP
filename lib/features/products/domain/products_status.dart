import 'package:ecommerce/data/model/product.dart';

abstract class ProductsStatus {}

class DisplayProductsSuccessfully extends ProductsStatus {
  List<Product> products ;
  DisplayProductsSuccessfully({required this.products});
}

class DisplayProductsLoading extends ProductsStatus {
  DisplayProductsLoading();
}

class DisplayProductsFailed extends ProductsStatus {
  String error ;
  DisplayProductsFailed({required this.error});
}