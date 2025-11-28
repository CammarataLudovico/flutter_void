
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_3_1/models/CartItem.dart';
import 'package:shopping_cart_3_1/models/Product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(
      id: '1',
      name: 'Smartphone',
      description: 'Ultimo modello ultratecnologico', 
      price: 599),
    Product(
      id: '2',
      name: 'SmarTV',
      description: 'Tv molto smart', 
      price: 399),
    Product(
      id: '3',
      name: 'Smartwatch',
      description: 'Smartwatch waterproof', 
      price: 199),
    Product(
      id: '4',
      name: 'Laptop',
      description: 'Modello con 64gb di Ram e SSD da 512GB', 
      price: 759),
  ];
});
  


final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>((){
  return CartNotifier();
});

class CartNotifier extends Notifier<List<CartItem>> {

  @override
  List<CartItem> build() {
    return [];
  }

  int get totalProducts {
    int total = 0;

    for (var i = 0; i < state.length; i++) {
      CartItem currentProd = state[i];
      total = total + currentProd.quantity; 
    }

    return total;
  }


  double get totalPrice {
    double totalCost = 0.00;

    for (var i = 0; i < state.length; i++) {
      double currentProdTotCost = state[i].product.price * state[i].quantity;
      totalCost = totalCost + currentProdTotCost; 
    }

    return totalCost;
  }
  

  void addProduct(Product product) {
    final productIndex = state.indexWhere((element) => element.product.id == product.id);

    if (productIndex >= 0) {
        state[productIndex].quantity++;
    } else {
        CartItem newItem = CartItem(product: product, quantity: 1);

        state = [...state, newItem];
      }
    }
  }





