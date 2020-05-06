import 'package:camera/camera.dart' as camera_lib;
import 'package:camera/camera.dart';
import 'package:fedi/refactored/camera/camera_model.dart';

class CameraByLensDirectionNotExistException implements Exception {
  final CameraLensDirection requiredLensDirection;
  final List<camera_lib.CameraDescription> availableCameras;

  CameraByLensDirectionNotExistException(
      this.requiredLensDirection, this.availableCameras);

  @override
  String toString() {
    return 'CameraByLensDirectionNotExistException{'
        'requiredLensDirection: $requiredLensDirection,'
        ' availableCameras: $availableCameras}';
  }
}

class CameraByIndexNotExistException implements Exception {
  final List<camera_lib.CameraDescription> availableCameras;
  final int requiredIndex;
  CameraByIndexNotExistException(this.availableCameras, this.requiredIndex);

  @override
  String toString() {
    return 'CameraByIndexNotExistException{'
        'availableCameras: $availableCameras,'
        ' requiredIndex: $requiredIndex}';
  }
}

class CamerasListIsEmptyException implements Exception {
  @override
  String toString() {
    return 'CamerasListIsEmptyException{}';
  }
}

class CamerasListErrorException implements Exception {
  @override
  String toString() {
    return 'CamerasListErrorException{}';
  }
}

abstract class CameraException implements Exception {
  final camera_lib.CameraDescription cameraDescription;
  final int index;
  final CameraLensDirection lensDirection;
  final CameraState state;
  CameraException(
      this.cameraDescription, this.index, this.lensDirection, this.state);

  @override
  String toString() {
    return 'CameraException{'
        'cameraDescription: $cameraDescription, index: $index,'
        ' type: $lensDirection, state: $state}';
  }
}

class CameraErrorException extends CameraException {
  final Exception cameraException;
  CameraErrorException(
      camera_lib.CameraDescription cameraDescription,
      int index,
      CameraLensDirection lensDirection,
      CameraState state,
      this.cameraException)
      : super(cameraDescription, index, lensDirection, state);

  @override
  String toString() {
    return 'CameraErrorException{'
        'cameraDescription: $cameraDescription, index: $index,'
        ' type: $lensDirection, state: $state, cameraException: $cameraException}';
  }
}

class CameraNotReadyException extends CameraException {
  final List<CameraState> desiredStates;
  CameraNotReadyException(camera_lib.CameraDescription cameraDescription, int index,
      CameraLensDirection lensDirection, CameraState state, this.desiredStates)
      : super(cameraDescription, index, lensDirection, state);
  @override
  String toString() {
    return 'CameraBusyException{'
        'cameraDescription: $cameraDescription, index: $index,'
        ' type: $lensDirection, state: $state, desiredStates: $desiredStates}';
  }
}
