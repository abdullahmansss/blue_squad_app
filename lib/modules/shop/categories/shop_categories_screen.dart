import 'package:blue_squad_app/layout/shop/cubit/cubit.dart';
import 'package:blue_squad_app/layout/shop/cubit/states.dart';
import 'package:blue_squad_app/models/shop/shop_categories_model.dart';
import 'package:blue_squad_app/shared/components/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyConditionalBuilder(
          condition: ShopCubit.get(context).shopCategoriesModel != null,
          builder: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => CategoryListItem(
              category:
                  ShopCubit.get(context).shopCategoriesModel?.data!.data[index],
            ),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: 10,
          ),
          fallback: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class CategoryListItem extends StatelessWidget {
  ShopCategory? category;

  CategoryListItem({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              category!.image,
            ),
            fit: BoxFit.cover,
            width: 60.0,
            height: 60.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              category!.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}
