import 'package:clean_architecture/data/models/picture_model.dart';
import 'package:clean_architecture/domain/use_cases/get_pictures_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'pictures_state.dart';

@injectable
class PicturesCubit extends Cubit<PicturesState> {
  final GetPictures getPicturesUseCase;

  PicturesCubit(this.getPicturesUseCase) : super(const PicturesState()) {
    getPictures();
  }

  void getPictures() {
    getPicturesUseCase.execute(
        page: state.pageNumber,
        limit: state.picsLimit ?? 100,
        onSuccess: (pictures) {
          emit(state.copyWith(
            pictures: pictures.pictures,
            hasPrev: pictures.prevUrl != null,
            hasNext: pictures.nextUrl != null,
          ));
        },
        onError: (error) {
          // handle error case
          throw "Not yet implemented";
        });
  }

  void onPreviousPageRequested() {
    emit(
      state.copyWith(pageNumber: (state.pageNumber ?? 2) - 1),
    );
    getPictures();
  }

  void onNextPageRequested() {
    emit(state.copyWith(pageNumber: (state.pageNumber ?? 1) + 1));
    getPictures();
  }

  void onLimitChanged(int limit) {
    emit(state.copyWith(picsLimist: limit));
    getPictures();
  }
}
