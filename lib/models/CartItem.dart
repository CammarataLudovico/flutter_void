import "package:shopping_cart_3_1/models/Product.dart";

class CartItem {
  CartItem({required this.product, required this.quantity});
  final Product product;
  int quantity;
}
