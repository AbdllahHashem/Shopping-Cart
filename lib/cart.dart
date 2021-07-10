
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_cart/item.dart';
import 'package:shoping_cart/states.dart';

class CartCubit extends Cubit<CartStates>{

  CartCubit():super(CartInitialState());

 static  CartCubit get(context) => BlocProvider.of(context);

   List<Item> items=[
    Item('Laptop',5550.0),
    Item('Telephone', 2250.0),
    Item('Tablet', 5550.0),
  ];

  List<Item> _items=[];
  double _totalPrice=0.0;

  void add(Item item)
  {
    _items.add(item);
    _totalPrice+=item.price;
    emit(CartAddState());
  }

  void remove(Item item)
  {
    _totalPrice-=item.price;

    _items.remove(item);
    emit(CartRemoveState());

  }

  int get count
  {
    return _items.length;

  }

  double get totlaPrice
  {
    return _totalPrice;
  }

  List<Item> get basketItems
  {
    return _items;
  }

}