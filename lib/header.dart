import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome
import '../utils/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String userName = "Hai, Ramdan";  // Dummy nama pengguna
  final double saldo = 1000000;  // Dummy saldo

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 4,
      automaticallyImplyLeading: false,  // Menghilangkan back button
      titleSpacing: 0,  // Menghilangkan jarak judul
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20), // Memberikan radius pada bagian bawah kiri dan kanan
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Mengurangi padding vertikal
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Kiri: Ikon Wallet dan Saldo
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.wallet,
                  color: Colors.white, // Ikon wallet putih
                  size: 24, // Menyesuaikan ukuran ikon
                ),
                SizedBox(height: 4),  // Mengurangi jarak
                Text(
                  'Rp ${saldo.toStringAsFixed(0)}',  // Format saldo
                  style: TextStyle(
                    fontSize: 14,  // Menyesuaikan ukuran font
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Saldo dengan teks putih
                  ),
                ),
              ],
            ),
            // Kanan: Ikon User dan Nama Pengguna
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.white, // Ikon user putih
                  size: 24, // Menyesuaikan ukuran ikon
                ),
                SizedBox(height: 4),  // Mengurangi jarak
                Text(
                  userName,  // Nama pengguna
                  style: TextStyle(
                    fontSize: 14,  // Menyesuaikan ukuran font
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Nama pengguna putih
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80); // Menentukan tinggi AppBar yang lebih pendek
}
