class ShopHomeModel
{
  late bool status;
  ShopHomeDetails? data;

  ShopHomeModel.fromMap(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['data'] != null ? ShopHomeDetails.fromMap(json['data']) : null;
  }
}

class ShopHomeDetails
{
  late List<ShopProduct> banners = [];
  late List<ShopProduct> products = [];

  ShopHomeDetails.fromMap(Map<String, dynamic> json)
  {
    json['banners'].forEach((element)
    {
      banners.add(ShopProduct.fromMap(element));
    });

    json['products'].forEach((element)
    {
      products.add(ShopProduct.fromMap(element));
    });
  }
}

class ShopProduct
{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late bool inFavorites;
  late bool inCart;

  ShopProduct.fromMap(Map<String, dynamic> json)
  {
    id = json['id']??0;
    price = json['price']??0;
    oldPrice = json['old_price']??0;
    discount = json['discount']??0;
    image = json['image']??'';
    name = json['name']??'';
    inFavorites = json['in_favorites']??false;
    inCart = json['in_cart']??false;
  }
}