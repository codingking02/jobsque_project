import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String getalljobsendpoint = "jobs";
  final client = varHttp.Client();

  Future<List<Map<String, dynamic>>?> getAllJobs(BuildContext context) async {
    // Replace with your API URL
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
      final response = await client.get(
        Uri.parse(
          baseUrl + getalljobsendpoint,
        ),
        headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> portfolioList = jsonResponse['data'];
          List<Map<String, dynamic>> portfolioData =
              List<Map<String, dynamic>>.from(portfolioList);
          return portfolioData;
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }
}
