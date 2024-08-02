import 'package:http/http.dart' as http;
import 'dart:convert';

class CommonService {
  final String _baseUrl = 'YOUR_API_BASE_URL'; // Replace with your API base URL

  Future<Map<String, dynamic>> login(String mobileNumber, String password, String department) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobile_number': mobileNumber,
        'password': password,
        'department_code': department,
        'email': '',
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<void> forgotPassword(String mobileNumber) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/forgot-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobileNumber': mobileNumber,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send forgot password request');
    }
  }

  Future<void> addFarmer(Map<String, String> farmerData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/add-farmer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(farmerData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add farmer');
    }
  }

  Future<List<Map<String, dynamic>>> getFarmers() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/get-farmers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get farmers');
    }
  }
}
