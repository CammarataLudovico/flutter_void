import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shopping_cart_3_1/models/CartItem.dart";
import "package:shopping_cart_3_1/models/Product.dart";

final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(() {
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
    final productIndex = state.indexWhere(
      (element) => element.product.id == product.id,
    );

    if (productIndex >= 0) {
      final updatedList = List<CartItem>.from(state);

      updatedList[productIndex] = CartItem(
        product: product,
        quantity: state[productIndex].quantity + 1,
      );

      state = updatedList;
    } else {
      final newItem = CartItem(product: product, quantity: 1);

      state = [...state, newItem];
    }
  }

  void incrementProductByOne(Product product) {
    final productIndex = state.indexWhere(
      (element) => element.product.id == product.id,
    );
    if (productIndex < 0) return;

    final updatedList = List<CartItem>.from(state);

    updatedList[productIndex] = CartItem(
      product: product,
      quantity: state[productIndex].quantity + 1,
    );

    state = updatedList;
  }

  void decrementProductByOne(Product product) {
    final productIndex = state.indexWhere(
      (element) => element.product.id == product.id,
    );

    if (state[productIndex].quantity > 1) {
      final updatedList = List<CartItem>.from(state);

      updatedList[productIndex] = CartItem(
        product: product,
        quantity: state[productIndex].quantity - 1,
      );

      state = updatedList;
    } else {
      state.removeAt(productIndex);

      state = [...state];
    }
  }
}
