import 'package:bloc1/screens/product_screen/bloc/product_bloc.dart';
import 'package:bloc1/screens/product_screen/bloc/product_event.dart';
import 'package:bloc1/screens/product_screen/bloc/product_state.dart';
import 'package:bloc1/screens/product_screen/widgets/product_card.dart';
import 'package:bloc1/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  ProductBloc productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proudcts"),
        actions: [
          IconButton(
            onPressed: () {
              productBloc.add(ProductGetEvent());
            },
            icon: Icon(Icons.api),
          ),
        ],
        backgroundColor: Colors.greenAccent,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        buildWhen: (prev, curr) => curr is ProductState,
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductGetState) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.products[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 9 / 10),
            );
          } else {
            return const Center(
              child: Text("Error to fetch the data"),
            );
          }
        },
      ),
    );
  }
}

// ----------------------------------------------------------------
// showing data using future builders
// ----------------------------------------------------------------
/*
body: FutureBuilder(
  future: ProductService.getProducts(),
  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.connectionState == ConnectionState.done) {
      List<Product> products = snapshot.data;
      print(products);

      return GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 9 / 10),
      );
    } else {
      return Text("Unable to fetch data");
    }
  },
),
*/
