import 'dart:async';

import 'package:bloc1/screens/product_screen/bloc/product_event.dart';
import 'package:bloc1/screens/product_screen/bloc/product_state.dart';
import 'package:bloc1/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // this state will be run when this page is loaded/opened
  ProductBloc() : super(ProductLoadingState()) {
    on<ProductGetEvent>(getProductEvent);

    // this should be called only after all the conditions are called
    add(ProductGetEvent());
  }

  // @override
  // void onEvent(ProductEvent event) {
  //   on<ProductGetEvent>((event, emit) async {
  //
  //   });
  //   super.onEvent(event);
  // }

// @override
// Stream<ProductState> mapEventToState(ProductEvent event) async* {
//   if (event is ProductGetEvent) {
//     yield ProductLoadingState();
//
//     List<Product> products = await ProductService.getProducts();
//     yield ProductGetState(products: products);
//   }
// }

// FutureOr<void> getProductEvent(
//     ProductGetEvent event, Emitter<ProductState> emit) async {
//   emit(ProductLoadingState());
//
//   List<Product> products = await ProductService.getProducts();
//   emit(ProductGetState(products: products));
// }

  FutureOr<void> getProductEvent(
      ProductGetEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    List<Product> products = await ProductService.getProducts();
    emit(ProductGetState(products: products));
  }
}
