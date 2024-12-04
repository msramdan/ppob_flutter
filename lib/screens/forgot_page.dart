import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../screens/login_page.dart'; // Menambahkan import untuk halaman Login

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Menggunakan background biru muda
      body: Stack(
        children: [
          // Lapisan biru muda di belakang card
          Positioned.fill(
            child: Container(
              color: AppColors.background, // Warna biru muda
            ),
          ),
          // Bagian atas dengan logo (lapisan biru tua) - Dipendekkan
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22, // Memperpendek tinggi lapisan biru tua
              decoration: BoxDecoration(
                color: AppColors.primary, // Warna biru utama
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40), // Menambahkan radius pada kiri bawah
                  bottomRight: Radius.circular(40), // Menambahkan radius pada kanan bawah
                ),
              ),
            ),
          ),
          // Card yang ada di depan
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17, // Posisi card lebih ke atas
            left: 16,
            right: 16,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Logo Forgot Password - Gambar (Diperbesar)
                    Image.asset(
                      'assets/images/logo_login.png', // Ganti dengan logo_login Anda
                      width: 150, // Ukuran logo diperbesar
                      height: 150, // Ukuran logo diperbesar
                    ),
                    SizedBox(height: 20),
                    // Input Field untuk Email
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email Address", // Mengubah label input untuk email
                        prefixIcon: Icon(Icons.email),
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors
                                  .grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        labelStyle: TextStyle(
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Tombol Kirim Link untuk Reset Password
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk mengirim link reset password
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primary, // Menggunakan warna biru utama
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        "Send Reset Link",
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              Colors.white, // Mengubah warna teks menjadi putih
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Footer Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Remember your password? "),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke Login Page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.primary, // Menggunakan warna biru utama
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
