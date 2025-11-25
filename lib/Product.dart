import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
  
  final String id;
  final String name;
  final String description;
  final double price;
}
