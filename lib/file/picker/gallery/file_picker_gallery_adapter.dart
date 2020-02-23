import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:photo_manager/photo_manager.dart';

FilePickerFile mapGalleryToFilePickerFIle(FileGalleryFile galleryFile) {
  FilePickerFile filePickerFile = FilePickerFile(file: galleryFile.file,
      type: mapFileGalleryToPickerType(galleryFile.type),
      isNeedDeleteAfterUsage: galleryFile.isNeedDeleteAfterUsage);
  return filePickerFile;
}

FilePickerFileType mapFileGalleryToPickerType(AssetType galleryType) {
  if(galleryType == null) {
    return null;
  }
  switch(galleryType) {

    case AssetType.other:
      return FilePickerFileType.other;
      break;
    case AssetType.image:
      return FilePickerFileType.image;
      break;
    case AssetType.video:
      return FilePickerFileType.video;
      break;
  }
  throw "Invalid AssetType $galleryType";
}