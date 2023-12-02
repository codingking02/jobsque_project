import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExperienceCollection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String experienceendpoint = "experince";
  final client = varHttp.Client();
  Future<void> experience(
      int user_id,
      String postion,
      String type_work,
      String comp_name,
      String location,
      String start,
      BuildContext context) async {
    final Map<String, dynamic> data = {
      'user_id': user_id,
      'postion': postion,
      'type_work': type_work,
      'comp_name': comp_name,
      'location': location,
      'start': start,
    };

    final prefs = await SharedPreferences.getInstance();

    final headers1 = {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    final headers2 = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };

    try {
      final response = await client.post(
        Uri.parse(
          baseUrl + experienceendpoint,
        ),
        headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Password updated successfully.
        print('Experience successfully');
        print('Response: ${response.body}');
      } else {
        // Handle error cases here.
        print(
            'Failed to update Experience. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle network errors.
      print('Error: $e');
    }
  }
}
