class ModelDevices
{
  String? image;
  String? name;
  String? price;
  ModelDevices(
      this.name,
      this.image,
      this.price,
  );
  ModelDevices.fromJson(Map<String,dynamic> json)
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