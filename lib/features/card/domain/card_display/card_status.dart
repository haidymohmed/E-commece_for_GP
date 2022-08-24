import 'package:ecommerce/data/model/product.dart';

abstract class CardStatus {}

class GetCardSuccessfully extends CardStatus {
  List<Product> products ;
  GetCardSuccessfully({required this.products});
}
class GetCardFailed extends CardStatus {
  String error ;
  GetCardFailed({required this.error});
}
class GetCardLoading extends CardStatus {

}

class CardAddedSuccessfully extends CardStatus{}
class CardDeletedSuccessfully extends CardStatus{}
class CardProcessFailed extends CardStatus{
  String error ;
  CardProcessFailed({required this.error});

}