abstract class NavbarEvent {}

class NavbarItemTapped extends NavbarEvent {
  final int index;
  NavbarItemTapped(this.index);
}