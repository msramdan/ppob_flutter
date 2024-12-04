import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';  // Import halaman HomePage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cek token di SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final tokenExpiration = prefs.getString('token_expiration');

  DateTime? expirationDate;
  if (tokenExpiration != null) {
    expirationDate = DateTime.parse(tokenExpiration);
  }

  // Jika token ada dan belum expired, arahkan ke HomePage
  if (token != null && expirationDate != null && expirationDate.isAfter(DateTime.now())) {
    runApp(MyApp(home: HomePage()));  // Ganti home dengan HomePage
  } else {
    runApp(MyApp(home: LoginPage()));
  }
}

class MyApp extends StatelessWidget {
  final Widget home;

  MyApp({required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPOB TecaPay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}
