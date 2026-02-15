import 'package:dio/dio.dart';

class ApiManager {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",
        receiveDataWhenStatusError: true,
      ),
    );
  }
}