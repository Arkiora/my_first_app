import 'package:flutter_bloc/flutter_bloc.dart';
import 'navbar_event.dart';
import 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarState(0)) {
    on<NavbarItemTapped>((event, emit) {
      emit(NavbarState(event.index));
    });
  }
}