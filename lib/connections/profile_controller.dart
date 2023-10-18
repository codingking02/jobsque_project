import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/data/provider/otpprovider..dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';

class ProfileConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String updatepasswordendpoint = "auth/user/update";
  static String getotpendpoint = "auth/otp";
  static String editbioendpoint = "user/profile/edit";
  final client = varHttp.Client();

  Future<void> updatePassword(String password, BuildContext context) async {
    final Map<String, String> data = {
      'password': password,
    };

    final headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await client.post(
        Uri.parse(
          baseUrl + updatepasswordendpoint,
        ),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        context.read<PasswordProvider>().setpass(password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Password Updated Successfully",
            ),
          ),
        );
        // Password updated successfully.
        print('Password updated successfully');
        print('Response: ${response.body}');
      } else {
        // Handle error cases here.
        print('Failed to update password. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle network errors.
      print('Error: $e');
    }
  }

  Future<void> updateName(String name, BuildContext context) async {
    final Map<String, String> data = {
      'name': name,
    };

    final headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await client.post(
        Uri.parse(
          baseUrl + updatepasswordendpoint,
        ),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        context.read<Profilename>().setname(name);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Name Updated Successfully",
            ),
          ),
        );
        // Password updated successfully.
        print('Name updated successfully');
        print('Response: ${response.body}');
      } else {
        // Handle error cases here.
        print('Failed to update Name. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle network errors.
      print('Error: $e');
    }
  }

  Future<void> getotp(
      String email, BuildContext context, Function function) async {
    final Map<String, String> data = {
      'email': email,
    };

    final headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await client.post(
        Uri.parse(
          baseUrl + getotpendpoint,
        ),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        context.read<OtpProvider>().setotp(jsonResponse["data"]);
        print(jsonResponse["data"]);
        print(context.read<OtpProvider>().otp);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Otp Sent Successfully",
            ),
          ),
        );
        // Password updated successfully.
        print('Otp Sent successfully');
        print('Response: ${response.body}');
        function();
      } else {
        // Handle error cases here.
        print('Failed to Send Otp. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle network errors.
      print('Error: $e');
    }
  }

  Future<void> updateBio(
    String bio,
    String address,
    String mobile,
    BuildContext context,
  ) async {
    // Replace with your API endpoint
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
      // Add any necessary headers here
    };

    final Map<String, String> data = {
      "bio": bio,
      "address": address,
      "mobile": mobile,
    };

    final String jsonData = json.encode(data);

    try {
      final response = await client.put(
        Uri.parse(
          baseUrl + editbioendpoint,
        ),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200) {
        print('Bio updated successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to update Bio. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error updating Bio: $e');
    }
  }
}
