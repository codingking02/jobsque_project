import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:jobsque_amit_project/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/provider/profilenameprovider.dart';
import 'package:provider/provider.dart';

class LoginConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";

  static String postEndPointLogin = "auth/login";
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

      print(
        'API response: $jsonResponse',
      );
      context.read<Profilename>().setname(
            jsonResponse["user"]["name"],
          );
      context.read<AccountEmailProvider>().setaccountemail(
            jsonResponse["user"]["email"],
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
}
