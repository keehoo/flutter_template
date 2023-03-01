import 'package:clean_architecture/data/services/rest_client.dart' as client;
import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/dio.dart';

abstract class RemoteDataSource {
  Future<ApiResult<List<Picture>>> getPictures(int page, int limit);
}

@Singleton(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  final client.RestClient httpClient;

  RemoteDataSourceImpl(this.httpClient);

  @override
  Future<ApiResult<List<Picture>>> getPictures(int page, int limit) async {
    try {
      HttpResponse<List<Picture>> result =
          await httpClient.getPicturesList(page: page, limit: limit);

      var header = result.response.headers;
      var headersMap = header.map;

      List<String> link = headersMap['link'] as List<String>;
      String? nextString;
      String? prevString;
      try {
        nextString = link.firstWhere((element) => element.contains("next"));
      } catch (e, s) {
        // nothing to do here
      }

      try {
        prevString = link.firstWhere((element) => element.contains("prev"));
      } catch (e, s) {
        // nothing to do here
      }

      return ApiResult.result(
          result: result.data,
          previousPageUrl: prevString,
          nextPageUrl: nextString);
    } catch (e, s) {
      return ApiResult.exception(e);
    }
  }
}

class ApiResult<T> {
  Object? exception;
  T? result;
  String? nextPageUrl;
  String? previousPageUrl;

  ApiResult(
      {this.exception, this.result, this.nextPageUrl, this.previousPageUrl});

  ApiResult.result(
      {required this.result, this.previousPageUrl, this.nextPageUrl});

  ApiResult.exception(this.exception);
}
