import 'dart:math';

import 'package:btr_gov/model/FarmarDetailModel.dart';
import 'package:btr_gov/model/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/ForgotResponse.dart';

class CommonService {
  final String _baseUrl =
      'https://api.learnwithchoudhary.com/api'; // Replace with your API base URL

  Future<LoginResponse> login(
      String mobileNumber, String password, String department) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': mobileNumber,
        'password': password,
        'department_code': department,
      }),
    );


    if (response.statusCode == 200) {
      print("login_response success: ${response.body}");
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      print("login_response error: ${response.toString()}");
      throw Exception('Failed to log in');
    }
  }

  Future<ForgotResponse> forgotPassword(String email, ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/forgot-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,

      }),
    );
    print("forgot_response common: ${response.body}");

    if (response.statusCode == 200) {
      print("forgot_response success: ${response.body}");
      return ForgotResponse.fromJson(jsonDecode(response.body));
    } else {
      print("forgot_response error: ${response.toString()}");
      throw Exception('Failed to log in');
    }
  }

  Future<FarmarDetailModel> getFarmerDetail() async {
    // final response = await http.get(Uri.parse('$_baseUrl/farmers/details/create'));
    //
    final response = await http.get(
      Uri.parse('$_baseUrl/farmers/details/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("getFarmerDetail common: ${response.body}");

    if (response.statusCode == 200) {
      print("getFarmerDetail success: ${response.body}");
      return FarmarDetailModel.fromJson(jsonDecode(response.body));
    } else {
      print("forgot_response error: ${response.toString()}");
      throw Exception('Failed to log in');
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
