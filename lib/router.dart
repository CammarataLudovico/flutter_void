import "package:go_router/go_router.dart";
import "package:shopping_cart_3_1/pages/cart.dart";
import "package:shopping_cart_3_1/pages/products.dart";

final router = GoRouter(
  initialLocation: "/products",
  routes: [
    GoRoute(
      path: "/products",
      builder: (context, state) => const ProductsPage(),
    ),

    GoRoute(path: "/cart", builder: (context, state) => const CartPage()),
  ],
);
