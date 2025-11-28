

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_3_1/provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCart = ref.watch(cartProvider);  
    final cartNotifier = ref.read(cartProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: Text('Il mio carrello'),
      ),
      body: myCart.isEmpty 
        ? const Center(child: Text('Carrello vuoto, aggiungi qualche prodotto'))
        : ListView(
          children: [
            for (final item in myCart)
              ListTile(
                title: Text(item.product.name),
                subtitle: Text('${item.product.price}€ (x${item.quantity})'),
              )
          ],
        )
    );
  }
}