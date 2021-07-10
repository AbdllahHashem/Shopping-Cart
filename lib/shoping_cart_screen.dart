import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_cart/cart.dart';
import 'package:shoping_cart/checout_page.dart';
import 'package:shoping_cart/item.dart';
import 'package:shoping_cart/states.dart';

class ShoppingCart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit,CartStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =CartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'Shopping Cart    \$   ${cubit.totlaPrice}'
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder:(context)=>CheckOutPage() ),
                      );
                    },
                        icon:Icon(Icons.shopping_cart) ),
                    Text('${cubit.count}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: cubit.items.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(cubit.items[index].title),
                subtitle: Text(cubit.items[index].price.toString()),
                trailing: Icon(Icons.add),
                onTap: (){
                  cubit.add(cubit.items[index]);
                },

              );
            },

          ),

        );
      },
    );
  }
}
