import 'package:clean_architecture/data/models/picture_model.dart';
import 'package:clean_architecture/view/cubits/pictures_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('PicturesState', () {
    const mockPictures = [
      PictureModel(url: 'https://example.com/picture1.png', id: '1', author: 'author1', width: 100, height: 100, downloadUrl: 'url'),
      PictureModel(url: 'https://example.com/picture2.png', id: '2', author: 'author2', width: 100, height: 100, downloadUrl: 'url2'),
    ];

    test('supports value comparison', () {
      expect(
        const PicturesState(
          pictures: mockPictures,
          pageNumber: 1,
          hasNext: true,
          hasPrev: false,
          picsLimit: 10,
        ),
        const PicturesState(
          pictures: mockPictures,
          pageNumber: 1,
          hasNext: true,
          hasPrev: false,
          picsLimit: 10,
        ),
      );
    });

    test('copyWith returns a new object with updated fields', () {
      const originalState = PicturesState(
        pictures: mockPictures,
        pageNumber: 1,
        hasNext: true,
        hasPrev: false,
        picsLimit: 10,
      );

      final updatedState = originalState.copyWith(pageNumber: 2, hasNext: false);

      expect(updatedState.pageNumber, equals(2));
      expect(updatedState.hasNext, equals(false));
      expect(updatedState.hasPrev, equals(false)); // Default value
      expect(updatedState.picsLimit, equals(10)); // Unchanged
      expect(updatedState.pictures, equals(mockPictures)); // Unchanged

      expect(updatedState, isNot(same(originalState))); // Ensure it's a new object
    });

    test('props contains all fields for Equatable', () {
      const state = PicturesState(
        pictures: mockPictures,
        pageNumber: 1,
        hasNext: true,
        hasPrev: false,
        picsLimit: 10,
      );

      expect(
        state.props,
        equals([
          mockPictures,
          1,
          true,
          false,
          10,
        ]),
      );
    });
  });
}
