class ModelTheBest
{
  String? image;
  String? name;
  String? price;
  ModelTheBest(
      this.price,
      this.name,
      this.image
      );
  ModelTheBest.fromJson(Map<String,dynamic> json)
  {
    image=json["image"];
    name=json["name"];
    price=json["price"];
  }
  Map<String,dynamic> toMap()
  {
    return
      {
        "image":image,
        "name":name,
        "price":price

      };
  }
}