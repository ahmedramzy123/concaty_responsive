class ModelCategories
{
  String? name;
  String? image;
  ModelCategories(
      this.image,
      this.name);
  ModelCategories.fromJson(Map<String,dynamic> json)
  {
    name=json["name"];
    image=json["image"];
  }
  Map<String,dynamic> toMap()
  {
    return {
      "name":name,
      "image":image,
    };
  }

}