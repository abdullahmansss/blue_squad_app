class ShopUserModel
{
  late bool status;
  late String message;
  ShopUserDetails? data;

  ShopUserModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ShopUserDetails.fromMap(json['data']) : null;
  }
}

class ShopUserDetails
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  ShopUserDetails.fromMap(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}