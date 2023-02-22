import 'package:clean_architecture/domain/use_cases/get_pictures_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'pictures_state.dart';

@injectable
class PicturesCubit extends Cubit<PicturesState> {
  final GetPictures getPicturesUseCase;

  PicturesCubit(this.getPicturesUseCase) : super(const PicturesInitial(0));

  void getPictures() {
    getPicturesUseCase.execute(
      onSuccess: (pictures) {
        // handle pictures downloaded
      },
      onError: (error) {
        // handle error case
      }
    );
  }

  void onPageIndexChanged(int destination) {
    emit(PicturesInitial(destination));
  }
}
