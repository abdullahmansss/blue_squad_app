import 'dart:developer';

import 'package:blue_squad_app/layout/shop/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/cubit/states.dart';
import 'package:blue_squad_app/models/shop/shop_favorites_model.dart';
import 'package:blue_squad_app/models/shop/shop_home_model.dart';
import 'package:blue_squad_app/shared/components/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyConditionalBuilder(
          condition: state is! ShopChangeFavoritesLoadingState,
          builder: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => FavoriteItem(
              shopProduct: ShopCubit.get(context).shopFavoritesModel!.data!.data[index],
            ),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: ShopCubit.get(context).shopFavoritesModel!.data!.data.length,
          ),
          fallback: Center(child: CupertinoActivityIndicator()),
        );
      },
    );
  }
}

class FavoriteItem extends StatelessWidget {
  FavoriteProduct? shopProduct;

  FavoriteItem({
    required this.shopProduct,
});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                shopProduct!.product.image,
              ),
              fit: BoxFit.cover,
              height: 120.0,
              width: 120.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopProduct!.product.name,
                    style: Theme.of(context)
                        .textTheme.subtitle1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${shopProduct!.product.price} L.E',
                        style: Theme.of(context)
                            .textTheme.subtitle1!.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavoritesData(shopProduct!.product.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          child: Icon(
                            Icons.favorite,
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
        ),
      ),
    );
  }
}

