import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:jobsque_amit_project/model/profile_model.dart';
import 'package:jobsque_amit_project/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/provider/profilenameprovider.dart';
import 'package:provider/provider.dart';

import '../model/user_api_model.dart';

class RegisterConnections {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String postEndPoint = "auth/register";

  final client = varHttp.Client();

  Future<Post> createPost(
    String name,
    String email,
    String password,
  ) async {
    Map mybody = {
      'name': name,
      'email': email,
      'password': password,
    };
    Response response = await client.post(
      Uri.parse(
        baseUrl + postEndPoint,
      ),
      body: jsonEncode(
        mybody,
      ),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      print('post created');
      Map<String, dynamic> _map = jsonDecode(response.body);
      Post _post = Post.fromJson(
        _map,
      );
      return _post;
    } else {
      throw Exception("failed to create posts ");
    }
  }

  Future<Post> createloginPost(
    String email,
    String password,
    BuildContext context,
    Function function,
  ) async {
    Map mybody = {
      'email': email,
      'password': password,
    };
    Response response = await client.post(
      Uri.parse(
        baseUrl + postEndPoint,
      ),
      body: jsonEncode(
        mybody,
      ),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      print('post created');
      Map<String, dynamic> _map = jsonDecode(response.body);
      Post _post = Post.fromJson(
        _map,
      );
      function();
      return _post;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Username or Password',
          ),
        ),
      );
      throw Exception("failed to create posts");
    }
  }

  Future<void> sendFormData(
    String name,
    String email,
    String password,
    BuildContext context,
    Function function,
  ) async {
    final apiUrl = Uri.parse(
      baseUrl + postEndPoint,
    );

    // Create a new multipart request
    final request = varHttp.MultipartRequest('POST', apiUrl);

    // Add form fields to the request
    request.fields['name'] = name;
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
      print('API response: $responseData');
      function();
    } else {
      // Request failed, handle the error
      print('API request failed with status code ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Email Already been taken',
          ),
        ),
      );
    }
  }
}
