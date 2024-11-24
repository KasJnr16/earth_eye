import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  static const String _baseUrl = "";

  //get request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse("$_baseUrl/$endpoint"));
    return _handleResponse(response);
  }

  //post request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  //put request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  //delete request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$endpoint"));
    return _handleResponse(response);
  }

  //Handle the Http response
  static Future<Map<String, dynamic>> _handleResponse(http.Response response) {
    //Customize it SpringDeveloper716
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }
}
