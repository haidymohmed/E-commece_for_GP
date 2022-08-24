import 'package:ecommerce/data/model/product.dart';

abstract class CategoriesScreenState {}

class ProductsCategoryFilterSuccessfully extends CategoriesScreenState {
  List<Product> products ;
  ProductsCategoryFilterSuccessfully({required this.products});
}
class ProductsCategoryFilterLoading extends CategoriesScreenState {}

class ProductsCategoryFilterFailed extends CategoriesScreenState {
  String error ;
  ProductsCategoryFilterFailed({required this.error});
}