import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_3_1/models/Product.dart';


final List<Product> listOfProducts = const [
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

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void _function() {
      debugPrint("funzione da implementare");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scegli i tuo prodotti'),
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



