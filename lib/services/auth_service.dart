import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../utils/helper.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };
    final response = await ApiHelper.callApi('login', body: body);
    final status = response['status'] ?? false;
    final message = response['message'] ?? 'An unknown error occurred';

    if (status) {
      // Ambil data dari response['data']
      final token = response['data']['token'];
      final expirationDate = DateTime.parse(
          response['data']['expires_at']);

      // Simpan token dan expiration date ke shared_preferences
      await _saveToken(token, expirationDate);
    }

    return {
      'status': status,
      'message': message,
    };
  }

  Future<void> _saveToken(String token, DateTime expirationDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('token_expiration', expirationDate.toIso8601String());
  }
}
