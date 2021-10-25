import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/media/camera/camera_media_service.dart';
import 'package:image_picker/image_picker.dart';

class CameraMediaService extends DisposableOwner
    implements ICameraMediaService {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Future<File?> pickImageFromCamera() async {
    var pickerImageXFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    var file = fileFromImage(pickerImageXFile);

    return file;
  }

  @override
  Future<File?> pickVideoFromCamera() async {
    var pickerImage = await imagePicker.pickVideo(source: ImageSource.camera);
    var file = fileFromImage(pickerImage);

    return file;
  }

  File? fileFromImage(XFile? imageFile) {
    var path = imageFile?.path;
    File? file;
    if (path != null) {
      file = File(path);
    }

    return file;
  }
}
