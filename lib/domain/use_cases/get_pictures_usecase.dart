import 'package:clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:clean_architecture/domain/repositories/picture_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetPictures extends UseCase<List<Picture>> {
  final PicturesRepository picturesRepository;

  GetPictures(this.picturesRepository);

  @override
  void execute(
      {int? page,
      int? limit,
      String? pathParams,
      Map<String, dynamic>? bodyParams,
      Map<String, dynamic>? queryParams,
      required Function(List<Picture> p1) onSuccess,
      Function(dynamic error)? onError}) {
    picturesRepository
        .getPictures(page: page ?? 0)
        .onError((error, stackTrace) {
      onError?.call(error);
      return Future.error(error!);
    }).then((ApiResult<List<Picture>> value) {
      onSuccess.call(value.result!); // to check this "!" here
    });
  }
}

// TODO: would be to have a clean way of executing Use Case so that every use case extends this base class
abstract class UseCase<T> {
  void execute(
      {int? page,
      int? limit,
      String pathParams,
      Map<String, dynamic>? bodyParams,
      Map<String, dynamic> queryParams,
      required Function(T) onSuccess,
      Function(dynamic)? onError});
}
