import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_3_1/models/CartItem.dart';
import 'package:shopping_cart_3_1/models/Product.dart';
import 'package:shopping_cart_3_1/provider.dart';


class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final listOfProducts = ref.watch(productsProvider);
    final myCart = ref.watch(cartProvider);


    void _function() {
      debugPrint("funzione da implementare");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scegli i tuo prodotti'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${myCart.length}'),
              child: const Icon(Icons.shopping_cart_rounded),
            ),
            onPressed: _function,
          
          ),
          const SizedBox(width: 100,)
        ],
      ),
      body: ListView(
        children: [
          for (var i = 0; i < listOfProducts.length; i++)
            ListTile(
              title: Text(listOfProducts[i].name),
              subtitle: Text(
                '${listOfProducts[i].description}\nPrezzo: \$${listOfProducts[i].price}'
                ),
              trailing: ElevatedButton(
                onPressed: _function, 
                child: const Text('compra')),
              
            )
        ],
      ),
    );
  }
}



