import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../screens/forgot_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              height: MediaQuery.of(context).size.height *
                  0.22, // Memperpendek tinggi lapisan biru tua
              decoration: BoxDecoration(
                color: AppColors.primary, // Warna biru utama
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(40), // Menambahkan radius pada kiri bawah
                  bottomRight: Radius.circular(
                      40), // Menambahkan radius pada kanan bawah
                ),
              ),
            ),
          ),
          // Card yang ada di depan
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.17, // Posisi card lebih ke atas
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
                    // Logo Login - Gambar (Diperbesar)
                    Image.asset(
                      'assets/images/logo_login.png', // Ganti dengan logo_login Anda
                      width: 170, // Ukuran logo diperbesar
                      height: 170, // Ukuran logo diperbesar
                    ),
                    SizedBox(height: 20),
                    // Input Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email", // Ganti dengan hanya "Email"
                        prefixIcon:
                            Icon(Icons.email), // Ganti ikon menjadi ikon email
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors
                                  .grey), // Ganti warna border jadi abu-abu
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Input Password dengan show/hide
                    TextField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors
                                  .grey), // Ganti warna border jadi abu-abu
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text("Forgot Password?"),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Tombol Login
                    ElevatedButton(
                      onPressed: () {},
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
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              Colors.white, // Mengubah warna teks menjadi putih
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Footer Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? "),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke Register Page
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: AppColors
                                  .primary, // Menggunakan warna biru utama
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
