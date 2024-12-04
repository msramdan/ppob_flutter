import 'dart:convert';
import 'package:flutter/material.dart';
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
    return {
      'status': status,
      'message': message,
    };
  }
}
