import 'package:fedi/media/device/gallery/photo_manager/photo_manager_device_gallery_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('compareAlbumTitlesAlphabeticallyAndFeatured Alphabetically', () {
    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured('a', 'b'),
      -1,
    );

    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured('b', 'a'),
      1,
    );

    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured('a', 'a'),
      0,
    );
  });
  test('compareAlbumTitlesAlphabeticallyAndFeatured Featured', () {
    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured('A', 'Recents'),
      1,
    );
    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured('Z', 'Recents'),
      1,
    );
    expect(
      PhotoManagerMediaDeviceGalleryBloc
          .compareAlbumTitlesAlphabeticallyAndFeatured(
        'Recently Added',
        'Recents',
      ),
      -1,
    );
  });
}
