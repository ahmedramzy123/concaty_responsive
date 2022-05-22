class ModelDatabase
{
  String? name;
  String? image;
  String? price;
  int? quantity;
  ModelDatabase(this.price,this.name,this.image,this.quantity);
  ModelDatabase.fromJson(Map<dynamic,dynamic> json)
  {
    name=json["name"];
    image=json["image"];
    price=json["price"];
    quantity=json["quantity"];
  }
  Map<dynamic,dynamic> toMap()
  {
    return {
      "name":name,
      "image":image,
      "price":price,
      "quantity":quantity,
    };
  }
}