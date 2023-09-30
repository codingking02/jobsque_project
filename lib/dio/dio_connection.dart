import 'package:dio/dio.dart';
import 'package:jobsque_amit_project/model/user_model.dart';

class DioConnection {
  static String URLbase = "https://jsonplaceholder.typicode.com/";
  String EndPoint = "users";
  final dio = Dio(
    BaseOptions(
      baseUrl: URLbase,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 3000),
    ),
  );
  Future<List<Users>> getusersdata() async {
    Response response = await dio.get(EndPoint);
    if (response.statusCode == 200) {
      List<dynamic> myusers = response.data;
      List<Users> allusers = myusers.map((e) => Users.fromJson(e)).toList();
      return allusers;
    } else {
      throw Exception('failed to get user data');
    }
  }
}
