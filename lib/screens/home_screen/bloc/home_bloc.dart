import 'package:bloc1/screens/home_screen/bloc/home_event.dart';
import 'package:bloc1/screens/home_screen/bloc/home_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Connectivity connectivity = Connectivity();

  HomeBloc() : super(InitialState()) {
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetNotConnectedEvent>(
        (event, emit) => emit(InternetNotConnectedState()));

    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet) {
        add(InternetConnectedEvent());
      } else {
        add(InternetNotConnectedEvent());
      }
    });
  }
}
