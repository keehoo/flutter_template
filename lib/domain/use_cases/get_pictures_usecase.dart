import 'package:clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:clean_architecture/data/models/picture_model.dart';
import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:clean_architecture/domain/repositories/picture_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPictures extends UseCase<PagedListOfPictures> {
  final PicturesRepository picturesRepository;

  GetPictures(this.picturesRepository);

  @override
  void execute(
      {int? page,
      int? limit,
      String? pathParams,
      Map<String, dynamic>? bodyParams,
      Map<String, dynamic>? queryParams,
      required Function(PagedListOfPictures picturesModel) onSuccess,
      Function(dynamic error)? onError}) {
    picturesRepository
        .getPictures(page: page ?? 1, limit: limit)
        .onError((error, stackTrace) {
      onError?.call(error);
      return Future.error(error!);
    })
        .then((ApiResult<List<Picture>> value) {
      List<PictureModel> mappedResult = [];
      value.result?.forEach((Picture pictureEntity) {
        var pictureModel = PictureModel.fromEntity(pictureEntity);
        mappedResult.add(pictureModel);
      });
      onSuccess.call(PagedListOfPictures(
          pictures: mappedResult,
          nextUrl: value.nextPageUrl,
          prevUrl: value.previousPageUrl));
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

class PagedListOfPictures {
  List<PictureModel> pictures;
  String? nextUrl;
  String? prevUrl;

  PagedListOfPictures({required this.pictures, this.nextUrl, this.prevUrl});
}
