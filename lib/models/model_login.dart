class ModelSignup
{
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? image;
  ModelSignup(
  {
    this.phone,
    this.email,
    this.name,
    this.uid,
    this.image
}
      );
  ModelSignup.fromJson(Map<String,dynamic> json)
  {
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    uid=json["uid"];
    image=json["image"];
  }
  Map<String,dynamic> toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'uid':uid,
        "image":image,

      };
  }
}