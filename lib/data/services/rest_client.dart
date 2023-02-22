import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@singleton
@RestApi(baseUrl: "https://picsum.photos/v2/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create() => _RestClient(
        Dio(),
        baseUrl: "https://picsum.photos/v2/",
      );

  @GET("/list")
  Future<List<Picture>> getPicturesList();
}
