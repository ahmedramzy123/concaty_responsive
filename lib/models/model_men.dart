class ModelMen
{
  String? color;
  String? image;
  String? imagedown;
  String? imageright;
  String? description;
  String? name;
  String? price;
  ModelMen(this.name,
      this.image,
      this.price,
      this.description,
      this.color,
      this.imagedown,
      this.imageright);
  ModelMen.fromJson(Map<String,dynamic> json)
  {
    name=json["name"];
    image=json["image"];
    imagedown=json["imagedown"];
    imageright=json["imageright"];
    description=json["description"];
    color=json["color"];
    price=json["price"];
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

    };
  }
}