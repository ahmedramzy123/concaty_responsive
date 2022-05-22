class ModelProduct
{
  String? coin;
  String? color;
  String? image;
  String? imagedown;
  String? imageright;
  String? description;
  String? name;
  String? price;
  ModelProduct(this.name,
      this.image,
      this.price,
      this.description,
      this.color,
      this.coin,
      this.imagedown,
      this.imageright);
  ModelProduct.fromJson(Map<String,dynamic> json)
  {
    name=json["name"];
    image=json["image"];
    imagedown=json["imagedown"];
    imageright=json["imageright"];
    description=json["description"];
    color=json["color"];
    price=json["price"];
    coin=json["coin"];
  }
  Map<String,dynamic> toMap()
  {
    return {
      "name":name,
      "image":image,
      "imagedown":imagedown,
      "imageright":imageright,
      "description":description,
      "color":color,
      "price":price,
      "coin":coin,

  };
}
}