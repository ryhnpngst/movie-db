import 'package:dio/dio.dart';
import 'package:movie_db/core/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpProvider = Provider<RestClient>(
  (ref){
    final dio = Dio()
      ..options.headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }
      ..options.receiveTimeout = 30000
      ..options.connectTimeout = 30000;
    
    //TODO change to movie db
    const String baseUrl = "https://api.quotable.io/";


    return RestClient(dio, baseUrl: baseUrl);
  },
);