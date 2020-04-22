import 'package:fedi/refactored/file/gallery/file_gallery_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('compareAlbumTitlesAlphabeticallyAndFeatured Alphabetically', () {
    expect(
        FileGalleryBloc.compareAlbumTitlesAlphabeticallyAndFeatured("a", "b"),
        -1);

    expect(
        FileGalleryBloc.compareAlbumTitlesAlphabeticallyAndFeatured("b", "a"),
        1);

    expect(
        FileGalleryBloc.compareAlbumTitlesAlphabeticallyAndFeatured("a", "a"),
        0);
  });
  test('compareAlbumTitlesAlphabeticallyAndFeatured Featured', () {
    expect(
        FileGalleryBloc
            .compareAlbumTitlesAlphabeticallyAndFeatured("A", "Recents"),
        1);
    expect(
        FileGalleryBloc
            .compareAlbumTitlesAlphabeticallyAndFeatured("Z", "Recents"),
        1);
    expect(
        FileGalleryBloc
            .compareAlbumTitlesAlphabeticallyAndFeatured("Recently Added", "R"
            "ecents"),
        -1);

  });
}
