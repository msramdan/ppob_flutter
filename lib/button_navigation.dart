import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome package
import '../utils/colors.dart'; // Pastikan AppColors diatur dengan benar

class ButtonNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const ButtonNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: AppColors.primary, // Navbar background color
      selectedItemColor: AppColors.buttonText, // Color for selected item
      unselectedItemColor:
          AppColors.buttonText.withOpacity(0.6), // Color for unselected items
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.plusCircle),
          label: 'Topup Saldo',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.signOutAlt),
          label: 'Logout',
        ),
      ],
    );
  }
}
