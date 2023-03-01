import 'package:clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:clean_architecture/domain/entity/picture.dart';

abstract class PicturesRepository {
  Future<ApiResult<List<Picture>>> getPictures({required int page, int? limit });
}
