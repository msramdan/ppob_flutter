import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  // URL dan API_KEY langsung didefinisikan tanpa menggunakan dotenv
  static String _baseUrl = 'http://localhost:8000/api';  // URL base
  static String _apiKey = 'your_api_key_here';  // API key


  static Future<Map<String, dynamic>> callApi(String endpoint, {Map<String, String>? params}) async {
    try {
      // Menambahkan api_key pada params
      Map<String, String> queryParams = {
        'api_key': _apiKey, // Menggunakan api_key yang sudah didefinisikan
        if (params != null) ...params, // Menambahkan params tambahan jika ada
      };

      // Membangun URL penuh dengan query parameters
      final Uri url = Uri.parse('$_baseUrl/$endpoint').replace(queryParameters: queryParams);

      // Mengirim permintaan HTTP GET
      final response = await http.get(url);

      // Memeriksa apakah permintaan berhasil
      if (response.statusCode == 200) {
        // Mengembalikan response JSON sebagai map
        return json.decode(response.body);
      } else {
        // Menangani jika permintaan gagal
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
