import '../../../models/product.dart';

class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductGetState extends ProductState {
  List<Product> products;

  ProductGetState({required this.products});
}

class ProductErrorState extends ProductState {}
