import 'package:camera/camera.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_model.dart';

class FileCaptureCameraByTypeNotExistException extends Exception {}

class FileCaptureCameraByIndexNotExistException extends Exception {}

abstract class FileCaptureCameraException extends Exception {
  final CameraDescription cameraDescription;
  final int index;
  final FileCaptureCameraType type;
  final FileCaptureCameraState state;

  FileCaptureCameraException(
      this.cameraDescription, this.index, this.type, this.state, String
      message): super(message);
}

class FileCaptureCameraErrorException extends Exception {}

class FileCaptureCameraBusyException extends Exception {}

class FileCaptureCamerasListIsEmptyException extends Exception {}
