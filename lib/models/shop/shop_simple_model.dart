class ShopSimpleModel
{
  late bool status;
  late String message;

  ShopSimpleModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
  }
}