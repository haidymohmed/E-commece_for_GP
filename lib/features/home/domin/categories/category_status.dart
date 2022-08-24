import '../../../../data/model/category.dart';

abstract class CategoriesState {}

class GetCategoriesSuccessfully extends CategoriesState {
  List<Category> categories ;
  GetCategoriesSuccessfully({required this.categories});
}
class GetCategoriesFailed extends CategoriesState {
  String error ;
  GetCategoriesFailed({required this.error});
}
class GetCategoriesLoading extends CategoriesState {}