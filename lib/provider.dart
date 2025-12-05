import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shopping_cart_3_1/models/CartItem.dart";
import "package:shopping_cart_3_1/models/Product.dart";

final productsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(
      id: "1",
      name: "Smartphone",
      description: "Ultimo modello ultratecnologico",
      price: 599,
    ),
    Product(id: "2", name: "SmarTV", description: "Tv molto smart", price: 399),
    Product(
      id: "3",
      name: "Smartwatch",
      description: "Smartwatch waterproof",
      price: 199,
    ),
    Product(
      id: "4",
      name: "Laptop",
      description: "Modello con 64gb di Ram e SSD da 512GB",
      price: 759,
    ),
  ];
});
