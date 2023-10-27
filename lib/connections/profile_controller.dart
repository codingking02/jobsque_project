import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as varHttp;
import 'package:http/http.dart';
import 'package:jobsque_amit_project/data/model/portfolio.dart';
import 'package:jobsque_amit_project/data/provider/bioprovider.dart';
import 'package:jobsque_amit_project/data/provider/otpprovider..dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/data/provider/registertokenprovider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';

class ProfileConnection {
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String updatepasswordendpoint = "auth/user/update";
  static String getotpendpoint = "auth/otp";
  static String editbioendpoint = "user/profile/edit";
  static String addportfolioendpoint = "user/profile/portofolios";
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
              "Data Updated Successfully",
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
        context.read<BioProvider>().setbio(bio);
        context.read<BioProvider>().setmobile(mobile);
        context.read<BioProvider>().setaddress(address);
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

  Future<void> updateinterstedjob(
    List<String> interested_work,
    BuildContext context,
  ) async {
    // Replace with your API endpoint
    final Map<String, String> headers = {
      'Authorization':
          'Bearer ${context.read<RegisterTokenProvider>().registertoken}',
      'Content-Type': 'application/json',
      // Add any necessary headers here
    };

    final Map<String, List<String>> data = {
      "interested_work": interested_work,
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
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Text('Interseted work saved Successfully'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20,
          ),
        ));
        print('interested_work updated successfully');
        print('Response: ${response.body}');
      } else {
        print(
            'Failed to update Intersted work. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error updating Bio: $e');
    }
  }

  Future<void> updateplaceofwork(
    String offlineplace,
    String remoteplace,
    BuildContext context,
  ) async {
    // Replace with your API endpoint
    final Map<String, String> headers = {
      'Authorization':
          'Bearer ${context.read<RegisterTokenProvider>().registertoken}',
      'Content-Type': 'application/json',
      // Add any necessary headers here
    };

    final Map<String, String> data = {
      "offline_place": offlineplace,
      "remote_place": remoteplace,
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
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Text('Place Of Work saved Successfully'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20,
          ),
        ));
        print('Place Of Work updated successfully');
        print('Response: ${response.body}');
      } else {
        print(
            'Failed to update Place Of Work. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error updating Bio: $e');
    }
  }

  Future<void> updatelanguage(
    String language,
    BuildContext context,
  ) async {
    // Replace with your API endpoint
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
      // Add any necessary headers here
    };

    final Map<String, String> data = {
      "language": language,
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
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Text('Language saved Successfully'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20,
          ),
        ));
        print('Language updated successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to update Language. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error updating Bio: $e');
    }
  }

  Future<void> uploadFilesToPostmanApi(
    File pdfFile,
    File image,
    BuildContext context,
  ) async {
    var request = varHttp.MultipartRequest(
      'POST',
      Uri.parse(
        baseUrl + addportfolioendpoint,
      ),
    );

    // Add the PDF file to the request
    request.files.add(await varHttp.MultipartFile.fromPath(
      'cv_file', // This is the field name for the PDF file in the API request
      pdfFile.path,
    ));

    // Add the image file to the request
    request.files.add(await varHttp.MultipartFile.fromPath(
      'image', // This is the field name for the PDF file in the API request
      image.path,
    ));
    // You can also add other fields as needed, e.g., headers, tokens, etc.
    request.headers['Authorization'] =
        'Bearer ${context.read<TokenProvider>().token}';

    try {
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
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        print(
          'API response: $jsonResponse',
        );
        // Request failed, handle the error here
        print('Failed to upload files. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred, handle the error here
      print('Error while uploading files: $e');
    }
  }

  Future<List<Map<String, dynamic>>?> fetchDataFromPostmanAPI(
      BuildContext context) async {
    // Replace with your API URL
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json',
      // Add any necessary headers here
    };
    try {
      final response = await client.get(
        Uri.parse(
          baseUrl + addportfolioendpoint,
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') &&
            jsonResponse['data']['portfolio'] is List) {
          List<dynamic> portfolioList = jsonResponse['data']['portfolio'];
          List<Map<String, dynamic>> portfolioData =
              List<Map<String, dynamic>>.from(portfolioList);
          return portfolioData;
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null; // Return null in case of an error or if the JSON structure doesn't match
  }
}
