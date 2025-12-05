import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shopping_cart_3_1/notifier.dart";

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(cartProvider);
    final totalCost = ref.watch(cartProvider.notifier).totalPrice;
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Il mio carrello")),
      body: myCart.isEmpty
          ? const Center(
              child: Text("Carrello vuoto, aggiungi qualche prodotto"),
            )
          : ListView(
              children: [
                for (final item in myCart)
                  ListTile(
                    title: Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              cartNotifier.decrementProductByOne(item.product),
                          icon: const Icon(Icons.remove_circle),
                        ),
                        Text(
                          "€${(item.product.price).toStringAsFixed(2)} (x${item.quantity})",
                        ),
                        IconButton(
                          onPressed: () =>
                              cartNotifier.incrementProductByOne(item.product),
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Totale carrello: €${totalCost.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
