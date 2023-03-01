part of 'home_page_navigation_cubit.dart';

class HomePageNavigationState extends Equatable {
  final int? pageIndex;
  final String? selectedItemId;

  const HomePageNavigationState({this.pageIndex, this.selectedItemId});

  HomePageNavigationState copyWith({int? pageIndex, String? selectedItemId}) =>
      HomePageNavigationState(
          pageIndex: pageIndex ?? this.pageIndex,
          selectedItemId: selectedItemId ?? this.selectedItemId);

  @override
  List<Object?> get props => [pageIndex, selectedItemId];
}
