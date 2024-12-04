import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  static String _baseUrl = 'http://localhost:8000/api';
  static String _apiKey = '7OsDAquAFqORK3PbunSU24qgawXp6ZTrZbNTSNaiPW85Aaevs9mVBRgqaXZJ3ziX';

  static Future<Map<String, dynamic>> callApi(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final Map<String, String> queryParams = {
        'api_key': _apiKey,
      };
      final Uri url = Uri.parse('$_baseUrl/$endpoint').replace(queryParameters: queryParams);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );
      return json.decode(response.body);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
