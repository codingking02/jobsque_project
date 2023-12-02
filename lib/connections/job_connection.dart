import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String getalljobsendpoint = "jobs";
  static String applyjobendpoint = "apply";
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

  Future<void> applyjob(
    File pdfFile,
    File otherfile,
    String name,
    String email,
    String mobile,
    String worktype,
    int jobid,
    int userid,
    BuildContext context,
  ) async {
    var request = varHttp.MultipartRequest(
      'POST',
      Uri.parse(
        baseUrl + applyjobendpoint,
      ),
    );

    // Add the PDF file to the request
    request.files.add(await varHttp.MultipartFile.fromPath(
      'cv_file', // This is the field name for the PDF file in the API request
      pdfFile.path,
    ));

    // Add the image file to the request
    request.files.add(await varHttp.MultipartFile.fromPath(
      'other_file', // This is the field name for the PDF file in the API request
      otherfile.path,
    ));
    // You can also add other fields as needed, e.g., headers, tokens, etc.
    final prefs = await SharedPreferences.getInstance();
    request.headers['Authorization'] = prefs.getBool("rememberme") == true
        ? 'Bearer ${prefs.getString("token")}'
        : 'Bearer ${context.read<TokenProvider>().token}';
    request.fields['email'] = email;
    request.fields['name'] = name;
    request.fields['mobile'] = mobile;
    request.fields['work_type'] = worktype;
    request.fields['jobs_id'] = jobid.toString();
    request.fields['user_id'] = userid.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);

      print(
        'API response: $jsonResponse',
      );
      // Request successful, handle the response here if needed
      print('Files uploaded successfully');
    } else {
      // Request   failed, handle the error here

      print('Failed to upload files. Status code: ${response.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>?> getapplyJobs(
      BuildContext context, int userid) async {
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
          baseUrl + applyjobendpoint + '/$userid',
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
