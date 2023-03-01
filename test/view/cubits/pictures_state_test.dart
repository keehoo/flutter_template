//
//
// import 'package:clean_architecture/domain/entity/picture.dart';
// import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
//
// void main() {
//   group('PicturesState', () {
//     test('props are equal when pageIndex and pictures are equal', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final state2 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       expect(state1.props, state2.props);
//     });
//
//     test('props are not equal when pageIndex is different', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final state2 = PicturesState(pageIndex: 2, pictures: [Picture(id: 1), Picture(id: 2)]);
//       expect(state1.props, isNot(state2.props));
//     });
//
//     test('props are not equal when pictures are different', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final state2 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 3)]);
//       expect(state1.props, isNot(state2.props));
//     });
//
//     test('copyWith creates a new state with the same props', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final state2 = state1.copyWith();
//       expect(state1.props, state2.props);
//     });
//
//     test('copyWith creates a new state with new pageIndex', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final state2 = state1.copyWith(pageIndex: 2);
//       expect(state1.pageIndex, 1);
//       expect(state2.pageIndex, 2);
//     });
//
//     test('copyWith creates a new state with new pictures', () {
//       final state1 = PicturesState(pageIndex: 1, pictures: [Picture(id: 1), Picture(id: 2)]);
//       final newPictures = [Picture(id: 3), Picture(id: 4)];
//       final state2 = state1.copyWith(pictures: newPictures);
//       expect(state1.pictures, [Picture(id: 1), Picture(id: 2)]);
//       expect(state2.pictures, newPictures);
//     });
//   });
// }
