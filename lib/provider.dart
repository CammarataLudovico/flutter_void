
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_3_1/models/CartItem.dart';

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>((){
  return CartNotifier();
});

class CartNotifier extends Notifier<List<CartItem>> {

  @override
  List<CartItem> build() {
    return [];
  }




}