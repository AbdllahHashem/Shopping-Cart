import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_cart/cart.dart';
import 'package:shoping_cart/shoping_cart_screen.dart';
import 'package:shoping_cart/states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CartCubit()),
      ],
      child: BlocConsumer<CartCubit,CartStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            home: ShoppingCart(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
