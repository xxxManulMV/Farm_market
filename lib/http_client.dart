import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpClient {
  final String _baseUrl;

  HttpClient({required String baseUrl}) : _baseUrl = baseUrl;

  Future<Map<String, dynamic>> _sendRequest(
      String endpoint, String method, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    http.Response response;

    if (method == 'POST') {
      response = await http.post(url, body: data);
    } else if (method == 'PUT') {
      response = await http.put(url, body: data);
    } else if (method == 'DELETE') {
      response = await http.delete(url);
    } else {
      response = await http.get(url);
    }

    // Parse response body
    final parsedJson = json.decode(response.body);

    // Check for errors
    if (response.statusCode != 200 || parsedJson == null) {
      throw Exception('Failed to load data from API');
    }

    // Return parsed JSON data
    return parsedJson;
  }

  Future<Map<String, dynamic>> get(String endpoint) async =>
      _sendRequest(endpoint, 'GET', {});

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async =>
      _sendRequest(endpoint, 'POST', data);

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> data) async =>
      _sendRequest(endpoint, 'PUT', data);

  Future<Map<String, dynamic>> delete(String endpoint) async =>
      _sendRequest(endpoint, 'DELETE', {});
}