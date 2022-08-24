import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/datasourse/card_Api.dart';
import 'package:ecommerce/data/model/product.dart';
import 'package:ecommerce/features/card/domain/card_display/card_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CardCubit extends Cubit<CardStatus>{
  late StreamSubscription<List<Product>> subscription ;
  static CardCubit get(context) => BlocProvider.of(context);
  CardApi cardApi = CardApi();
  CardCubit() : super(GetCardLoading()){
    try{
      subscription = cardApi.getCard().listen((event) {
        print(event.length);
        emit(GetCardSuccessfully(products : event));
      });
    // ignore: empty_catches
    }on FirebaseException catch (e){
      emit(GetCardFailed(error : e.message.toString()));
    }
  }

  addToCard(Product product){
    try{
      cardApi.addToCard(product);
      emit(CardAddedSuccessfully());
    }on FirebaseException catch (e){
      emit(CardProcessFailed(error : e.message.toString()));
    }
  }
  deleteFromCard(Product product){
    try{
      cardApi.deleteFromCard(product);
      emit(CardDeletedSuccessfully());
    }on FirebaseException catch (e){
      emit(CardProcessFailed(error : e.message.toString()));
    }
  }
}