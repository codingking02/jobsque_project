import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/model/filterjob.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as varHttp;

class FilterJobProvider with ChangeNotifier {
  List<FilterJob> _jobs = [];

  List<FilterJob> get jobs => _jobs;
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String filterjob = "jobs/filter";

  final client = varHttp.Client();

  Future<void> fetchJobs(
    String name,
    String location,
    String salary,
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final headers1 = {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      // You can add other headers if needed
    };
    final headers2 = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      // You can add other headers if needed
    };

    var response = await client.post(
      Uri.parse(
        baseUrl + filterjob + '?name=$name&location=$location&salary=$salary',
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var jobData =
          jsonData['data'] as List; // Assuming 'data' is an array of jobs
      _jobs = jobData.map((job) => FilterJob.fromJson(job)).toList();
      notifyListeners();
      print(jsonData);
    } else {
      print(
        json.decode(
          response.body,
        ),
      );
      throw Exception('Failed to load jobs');
    }
  }
}
