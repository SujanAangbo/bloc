import 'package:bloc1/screens/home_screen/bloc/home_bloc.dart';
import 'package:bloc1/screens/home_screen/bloc/home_event.dart';
import 'package:bloc1/screens/home_screen/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: HomeBloc(),
          builder: (BuildContext context, state) {
            if (state is InternetConnectedState) {
              return const Text("Connected to internet");
            } else if (state is InternetNotConnectedState) {
              return const Text("Unable to connect to internet");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
