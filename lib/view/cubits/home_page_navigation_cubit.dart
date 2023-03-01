import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_page_navigation_state.dart';

typedef OnLocationChanged = Function(String);

@injectable
class HomePageNavigationCubit extends Cubit<HomePageNavigationState> {
  HomePageNavigationCubit(@factoryParam this.onLocationChanged)
      : super(const HomePageNavigationState());

  final OnLocationChanged onLocationChanged;

  void onPageIndexChanged(int destination) {
    emit(HomePageNavigationState(pageIndex: destination));
  }

  void onShowPictureDetails({required String pictureId}) {
    emit(HomePageNavigationState(pageIndex: 1, selectedItemId: pictureId));
  }
}
