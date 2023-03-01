import 'package:clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:clean_architecture/domain/repositories/picture_repository.dart';
import 'package:injectable/injectable.dart' show Singleton;

const int _defaultLimit = 100;

@Singleton(as: PicturesRepository)
class PictureResitoryImpl extends PicturesRepository {
  final RemoteDataSource remoteDataSource;

  PictureResitoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Picture>>> getPictures({required int page, int? limit}) {
    print("calling remote data source - get pictures");
    return remoteDataSource.getPictures(page, limit ?? _defaultLimit);
  }
}
