import 'package:camera/camera.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_model.dart';

abstract class IFileCaptureCameraBloc {
  Stream<int> get selectedCameraIndexStream;
  int get selectedCameraIndex;

  CameraController controller;

  Stream<FileCaptureCameraState> get selectedCameraStateStream;
  FileCaptureCameraState get selectedCameraState;
  Stream<FileCaptureCameraType> get selectedCameraTypeStream;
  FileCaptureCameraType get selectedCameraType;

  List<CameraDescription> get availableCameras;
  Stream<List<CameraDescription>> get availableCamerasStream;

  switchFrontBackCamera();
  chooseCameraByType(FileCaptureCameraType type);
  chooseCameraByIndex(int index);


}