import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

//TODO change to movie db
@RestApi(baseUrl: "https://api.example.io/")
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  
  @GET("/example")
  Future<Response> getRandomQuotes();
}

@JsonSerializable()
class Response{
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  Response({this.id, this.name, this.avatar, this.createdAt});

  factory Response.fromJson(Map<String, dynamic> json) =>
    _$ResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
