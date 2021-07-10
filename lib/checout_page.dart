import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_cart/cart.dart';
import 'package:shoping_cart/states.dart';

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Checkout Page    \$   ${cubit.totlaPrice}',
            ),

            centerTitle: true,
          ),
          body: cubit.count == 0
              ? Center(
                child: Text('There is no Items in your Cart ',style:
            TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
            ),),
              )
              : ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(
                        cubit.basketItems[index].title,
                      ),
                      subtitle:
                          Text(cubit.basketItems[index].price.toString()),
                      trailing: Icon(Icons.delete),
                      onTap: () {
                        cubit.remove(cubit.items[index]);

                      },
                    ),
                  ),
                  itemCount: cubit.count,
                ),
        );
      },
    );
  }
}
