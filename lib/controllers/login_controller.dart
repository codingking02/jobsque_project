import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/provider/tokenprovider.dart';
import 'package:provider/provider.dart';

class LoginConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String postEndPointLogin = "auth/login";
  final client = varHttp.Client();
  Future<void> loginwithapi(
    String email,
    String password,
    BuildContext context,
    Function function,
  ) async {
    final apiUrl = Uri.parse(
      baseUrl + postEndPointLogin,
    );

    // Create a new multipart request
    final request = varHttp.MultipartRequest('POST', apiUrl);

    // Add form fields to the request

    request.fields['email'] = email;
    request.fields['password'] = password;

    // Send the request
    final response = await request.send();

    // Check the response status code
    if (response.statusCode == 200) {
      print(
        'post created',
      );
      // Request was successful, handle the response data here
      final responseData = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseData);
      print(' User name :  ${jsonResponse["user"]["name"]}');
      print(' Email :  ${jsonResponse["user"]["email"]}');
      print(' Token :  ${jsonResponse["token"]}');

      print(
        'API response: $jsonResponse',
      );
      context.read<Profilename>().setname(
            jsonResponse["user"]["name"],
          );
      context.read<AccountEmailProvider>().setaccountemail(
            jsonResponse["user"]["email"],
          );
      context.read<TokenProvider>().settoken(
            jsonResponse["token"],
          );
      context.read<PasswordProvider>().setpass(
            password,
          );
      responseData;
      print(request.fields);
      function();
    } else {
      // Request failed, handle the error
      print('API request failed with status code ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Email or Password is Invalid",
          ),
        ),
      );
    }
  }

  Future<void> updatePassword(String email, String newPassword) async {
    final Map<String, String> data = {
      'email': email,
      'password': newPassword,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await client.post(
        Uri.parse(
          baseUrl + postEndPointLogin,
        ),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Password updated successfully.
        print('Password updated successfully');
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
}
