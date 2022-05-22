class ModelMore
{
  String? name;
  String? image;
  ModelMore(this.image,this.name);
  ModelMore.fromJson(Map<String,dynamic> json)
  {
    name=json["name"];
    image=json["image"];
  }
  Map<String,dynamic> toMap()
  {
    return{
      "name":name,
      "image":image
    };
  }
}
