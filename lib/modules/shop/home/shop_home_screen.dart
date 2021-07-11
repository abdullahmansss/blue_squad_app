import 'package:blue_squad_app/layout/shop/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/cubit/states.dart';
import 'package:blue_squad_app/models/shop/shop_categories_model.dart';
import 'package:blue_squad_app/models/shop/shop_home_model.dart';
import 'package:blue_squad_app/shared/components/conditional_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyConditionalBuilder(
          condition: ShopCubit.get(context).shopHomeModel != null &&
              ShopCubit.get(context).shopCategoriesModel != null,
          builder: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: ShopCubit.get(context)
                      .shopHomeModel
                      ?.data
                      ?.banners
                      .map((e) => Image(
                            image: NetworkImage(e.image),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  height: 120.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryItem(
                      category: ShopCubit.get(context)
                          .shopCategoriesModel!
                          .data!
                          .data[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.0,
                    ),
                    itemCount: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'New Arrivals',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.6,
                    children: List.generate(
                      ShopCubit.get(context)
                              .shopHomeModel
                              ?.data!
                              .products
                              .length ??
                          0,
                      (index) => ProductItem(
                        shopProduct: ShopCubit.get(context)
                            .shopHomeModel
                            ?.data!
                            .products[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          fallback: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  ShopProduct? shopProduct;

  ProductItem({
    this.shopProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(
            shopProduct!.image,
          ),
          width: double.infinity,
          height: 200.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                shopProduct!.name,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    shopProduct!.price.toString(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.blue,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if(shopProduct!.discount != 0)
                    Text(
                    shopProduct!.oldPrice.toString(),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changeFavoritesData(shopProduct!.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      child: Icon(
                        ShopCubit.get(context).favoritesList[shopProduct!.id]! ? Icons.favorite : Icons.favorite_border_outlined,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  ShopCategory? category;

  CategoryItem({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              category!.image,
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.8),
            width: double.infinity,
            padding: EdgeInsets.all(4.0),
            child: Text(
              category!.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}