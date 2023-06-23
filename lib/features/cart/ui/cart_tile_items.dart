import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_test/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_test/features/home/model/home_product_data_model.dart';

class CartTileWiget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWiget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // cart.add(HomeProductWishListButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductCartButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
