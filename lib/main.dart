import 'package:bloc1/screens/home_screen/bloc/home_bloc.dart';
import 'package:bloc1/screens/home_screen/home_screen.dart';
import 'package:bloc1/screens/product_screen/bloc/product_bloc.dart';
import 'package:bloc1/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ProductScreen(),
        // home: const HomeScreen(),
      ),
    );
  }
}
