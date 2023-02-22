import 'package:clean_architecture/domain/entity/picture.dart';
import 'package:equatable/equatable.dart';

class PictureModel extends Equatable {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  const PictureModel(
      {required this.id,
      required this.author,
      required this.width,
      required this.height,
      required this.url,
      required this.downloadUrl});

  /* mapper function */
  Picture get asEntity => Picture(
      id: id,
      author: author,
      width: width,
      height: height,
      url: url,
      downloadUrl: downloadUrl);

  @override
  List<Object?> get props => [
        id,
        author,
        width,
        height,
        url,
        downloadUrl,
      ];
}
