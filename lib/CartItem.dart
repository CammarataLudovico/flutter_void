import 'package:shopping_cart_3_1/Product.dart';

class Cartitem {
  Cartitem({
    required this.product,
    required this.quantity
  });
  final Product product;
  int quantity;
}