part of 'pictures_cubit.dart';

class PicturesState extends Equatable {
  final List<PictureModel>? pictures;
  final int? pageNumber;
  final bool? hasNext;
  final bool? hasPrev;
  final int? picsLimit;

  const PicturesState(
      {this.picsLimit, this.pageNumber, this.pictures, this.hasNext, this.hasPrev});

  PicturesState copyWith({
    List<PictureModel>? pictures,
    int? pageNumber,
    bool? hasNext,
    bool? hasPrev,
    int? picsLimist
  }) {
    return PicturesState(
        pageNumber: pageNumber ?? this.pageNumber,
        pictures: pictures ?? this.pictures,
        hasNext: hasNext ?? false,
        picsLimit: picsLimist ?? picsLimit, // fixme: typo
        hasPrev: hasPrev ?? false);
  }

  @override
  List<Object?> get props => [pictures, pageNumber, hasNext, hasPrev, picsLimit];
}
