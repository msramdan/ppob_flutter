import 'package:flutter/material.dart';
import '../utils/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Menentukan tinggi AppBar
}
