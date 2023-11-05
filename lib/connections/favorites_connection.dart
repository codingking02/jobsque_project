import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String postfavoritesendpoint = "favorites";

  final client = varHttp.Client();
  Future<void> postDataWithId(
    int id,
    BuildContext context,
  ) async {
    final Map<String, dynamic> data = {
      'job_id': id,
    };
    final body = json.encode(data);
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
          baseUrl + postfavoritesendpoint,
        ),
        headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Request successful: ${response.body}');
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<List<Map<String, dynamic>>?> getAllSaved(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final headers1 = {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    final headers2 = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };

    final response = await client.get(
      Uri.parse(
        baseUrl + postfavoritesendpoint,
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = [];
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Check if the "data" key exists in the response JSON
      if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
        data = List<Map<String, dynamic>>.from(jsonResponse['data']);
      }

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> deleteSaved(
    int id,
    BuildContext context,
  ) async {
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
      final response = await client.delete(
        Uri.parse(
          baseUrl + postfavoritesendpoint + "/$id",
        ),
        headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
      );

      if (response.statusCode == 200) {
        print('Resource with ID $id deleted successfully');
        print('Response body: ${response.body}');
      } else {
        print(
            'Failed to delete resource with ID $id. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error while deleting resource: $e');
    }
  }
}
