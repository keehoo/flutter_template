part of 'pictures_cubit.dart';

abstract class PicturesState extends Equatable {
  final int pageIndex;

  const PicturesState(this.pageIndex);
}

class PicturesInitial extends PicturesState {
  const PicturesInitial(super.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}
