class ShopCategoriesModel {
  late bool status;
  ShopCategoriesDetails? data;

  ShopCategoriesModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['data'] != null ? ShopCategoriesDetails.fromMap(json['data']) : null;
  }
}

class ShopCategoriesDetails {
  late List<ShopCategory> data = [];

  ShopCategoriesDetails.fromMap(Map<String, dynamic> json)
  {
    json['data'].forEach((element)
    {
      data.add(ShopCategory.fromMap(element));
    });
  }
}

class ShopCategory {
  late int id;
  late String image;
  late String name;

  ShopCategory.fromMap(Map<String, dynamic> json)
  {
    id = json['id']??0;
    image = json['image']??'';
    name = json['name']??'';
  }
}