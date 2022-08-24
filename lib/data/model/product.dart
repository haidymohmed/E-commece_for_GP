class Product{
  late String name , description , image , id , brand , categoryId;
  late int price , discount ;
  int quantity = 0 ;
  late bool isFav;
  Product({
    required this.id ,
    required this.name ,
    required this.description ,
    required this.image ,
    required this.price ,
    required this.discount ,
    required this.brand ,
    required this.categoryId ,
    required this.isFav
  });
  Product.fromJson(Map<String , dynamic> json){
    id = json["id"] ;
    name = json["name"] ;
    image = json["image"] ;
    description = json["description"] ;
    price = json["price"] ;
    discount = json["discount"] ;
    brand = json["brand"] ;
    categoryId = json["categoryId"] ;
  }
  Product.fromLocalJson(Map<String , dynamic> json){
    id = json["id"] ;
    name = json["name"] ;
    image = json["image"] ;
    description = json["description"] ;
    price = json["price"] ;
    discount = json["discount"] ;
    brand = json["brand"] ;
    categoryId = json["categoryId"] ;
    quantity = json["quantity"];
  }
  toJson(){
    return {
      "id" : id ,
      "name" : name ,
      "image" : image ,
      "description" : description ,
      "price" : price ,
      "discount" : discount ,
      "brand" : brand ,
      "categoryId" : categoryId ,
      "quantity" : quantity ,

    };
  }
}