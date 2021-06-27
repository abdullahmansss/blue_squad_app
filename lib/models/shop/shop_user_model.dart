class ShopUserModel
{
  bool status;
  String message;
  ShopUserDetails data;

  ShopUserModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ShopUserDetails.fromMap(json['data']) : null;
  }
}

class ShopUserDetails
{
  int id;
  String name;
  String email;
  String phone;
  String image;
  String token;

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