import 'package:blue_squad_app/models/shop/shop_home_model.dart';

class ShopFavoritesModel {
  late bool status;
  ShopFavoritesDetails? data;

  ShopFavoritesModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['data'] != null ? ShopFavoritesDetails.fromMap(json['data']) : null;
  }
}

class ShopFavoritesDetails {
  late List<FavoriteProduct> data = [];

  ShopFavoritesDetails.fromMap(Map<String, dynamic> json)
  {
    json['data'].forEach((element)
    {
      data.add(FavoriteProduct.fromMap(element));
    });
  }
}

class FavoriteProduct {
  late int id;
  late ShopProduct product;

  FavoriteProduct.fromMap(Map<String, dynamic> json)
  {
    id = json['id']??0;
    product = ShopProduct.fromMap(json['product']);
  }
}