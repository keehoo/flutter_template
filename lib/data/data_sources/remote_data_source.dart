import 'package:clean_architecture/data/services/rest_client.dart' as client;
import 'package:injectable/injectable.dart';
import 'package:clean_architecture/domain/entity/picture.dart';

abstract class RemoteDataSource {
  Future<ApiResult<List<Picture>>> getPictures(int page);
}

@Singleton(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  final client.RestClient httpClient;

  RemoteDataSourceImpl(this.httpClient);

  @override
  Future<ApiResult<List<Picture>>> getPictures(int page) async {
    try {
      var result = await httpClient.getPicturesList();
      return ApiResult.result(result);
    } catch (e, s) {
      return ApiResult.exception(e);
    }
  }
}

class ApiResult<T> {
  Object? exception;
  T? result;

  ApiResult({this.exception, this.result});

  ApiResult.result(this.result);

  ApiResult.exception(this.exception);


}
