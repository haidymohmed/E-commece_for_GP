class Category {
  late String name , image , id ;
  Category({
    required this.id ,
    required this.name ,
    required this.image ,
  });
  Category.fromJson(Map<String , dynamic> json){
    id = json["id"] ;
    name = json["name"] ;
    image = json["image"] ;
  }
}