import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/data/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/data/provider/useridprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String postEndPointLogin = "auth/login";
  static String postEndPointgetprofile = "auth/profile";

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Congratualations data is right',
          ),
        ),
      );
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
      context.read<UserIdProvider>().setuserid(jsonResponse["user"]["id"]);
      print(context.read<UserIdProvider>().userid);
      final prefs = await SharedPreferences.getInstance();

      if (prefs.getBool("rememberme") == true) {
        prefs.setInt("userid", jsonResponse["user"]['id']);
        prefs.setString("token", jsonResponse["token"]);
        prefs.setString("Username", jsonResponse["user"]["name"]);
        prefs.setString("Username", jsonResponse["user"]["email"]);
      }

      responseData;
      print(request.fields);
      function();
      print(
        prefs.getString("token"),
      );
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

  Future<Map<String, dynamic>> getprofile(BuildContext context) async {
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
        baseUrl + postEndPointgetprofile,
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> datas = data['data'];
      print(data);
      print(datas);
      return datas;
    } else {
      print(
        json.decode(
          response.body,
        ),
      );
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
