import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navbar/navbar_bloc.dart';
import '../bloc/navbar/navbar_event.dart';
import '../bloc/navbar/navbar_state.dart';
import '../screens/home_screen.dart';
import '../screens/cours_screen.dart';
import '../screens/entrainement_screen.dart';
import '../screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  // Pages à afficher
  final List<Widget> _pages = [
    const HomeScreen(),
    const CoursScreen(),
    const EntrainementScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return Scaffold(
            body: _pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                BlocProvider.of<NavbarBloc>(context).add(NavbarItemTapped(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Cours',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help_outline),
                  label: 'Entrainement',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}