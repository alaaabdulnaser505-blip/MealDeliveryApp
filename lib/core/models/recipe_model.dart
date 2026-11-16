class RecipeModel {
  final String dishName;
  final String dishDescription;
  final String time;
  final double price;
  final String imagePath;
  final double rating;

  RecipeModel({required this.dishName,
    required this.dishDescription,
    required this.time,
    required this.price,
    required this.imagePath,
    required this.rating});

Map<String, dynamic> toJson(){
  return {
    "dishName":dishName,
    "dishDescription":dishDescription,
    "time":time,
    "price":price,
    "imagePath":imagePath,
    "rating":rating
  };
}

factory RecipeModel.fromJson(Map<String, dynamic> json){
  return RecipeModel(
    dishName:json["dishName"],
    dishDescription:json["dishDescription"],
    time:json["time"],
    price:json["price"],
    imagePath:json["imagePath"],
    rating:json["rating"]
  );
}
}