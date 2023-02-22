import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Picture extends Equatable {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  const Picture(
      {required this.id,
      required this.author,
      required this.width,
      required this.height,
      required this.url,
      required this.downloadUrl});

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> get toJson => _$PictureToJson(this);

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
