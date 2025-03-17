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
  MainScreen({super.key});

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
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                BlocProvider.of<NavbarBloc>(context).add(NavbarItemTapped(index));
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Icon_home.png',
                    height: 24,
                    width: 24,
                    color: state.selectedIndex == 0 ? Colors.black : Colors.grey,
                  ),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Icon_cours.png',
                    height: 24,
                    width: 24,
                    color: state.selectedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  label: 'Cours',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Icon_entrainement.png',
                    height: 24,
                    width: 24,
                    color: state.selectedIndex == 2 ? Colors.black : Colors.grey,
                  ),
                  label: 'Entrainement',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Icon_profil.png',
                    height: 24,
                    width: 24,
                    color: state.selectedIndex == 3 ? Colors.black : Colors.grey,
                  ),
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