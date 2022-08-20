class Product{
  late String name , description , image , id , brand;
  late int price , discount ;
  late bool isFav ;
  Product({
    required this.id ,
    required this.name ,
    required this.description ,
    required this.image ,
    required this.price ,
    required this.discount ,
    required this.isFav,
    required this.brand
  });
}