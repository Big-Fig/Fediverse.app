import 'package:camera/camera.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_bloc.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_model.dart';

const _frontCameraTypeIndex = 1;
const _backCameraTypeIndex = 0;

_calculateCameraIndexByType(FileCaptureCameraType cameraType) {
  switch (cameraType) {
    case FileCaptureCameraType.front:
      return _frontCameraTypeIndex;
      break;
    case FileCaptureCameraType.back:
      return _backCameraTypeIndex;
      break;
    default:
      throw "Invalid cameraType $cameraType";
      break;
  }
}

class FileCaptureCameraBloc extends AsyncInitLoadingBloc
    implements IFileCaptureCameraBloc {
  FileCaptureCameraBloc() : this.byCameraType();

  FileCaptureCameraBloc.byCameraType(
      {FileCaptureCameraType startCameraType = FileCaptureCameraType.back})
      : this.byCameraIndex(
            startCameraIndex: _calculateCameraIndexByType(startCameraType));

  FileCaptureCameraBloc.byCameraIndex(
      {int startCameraIndex = _backCameraTypeIndex});

  @override
  Future internalAsyncInit() {

    controller = CameraController(availableCameras[selectedCameraIndex], ResolutionPreset
        .high);
  }

  @override
  CameraController controller;

  @override
  List<CameraDescription> get availableCameras =>
      throw UnimplementedError();

  @override
  // TODO: implement availableCamerasStream
  Stream<List<CameraDescription>> get availableCamerasStream =>
      throw UnimplementedError();

  @override
  chooseCameraByIndex(int index) {
    // TODO: implement chooseCameraByIndex
    throw UnimplementedError();
  }

  @override
  chooseCameraByType(FileCaptureCameraType type) {
    // TODO: implement chooseCameraByType
    throw UnimplementedError();
  }

  @override
  // TODO: implement selectedCameraIndex
  int get selectedCameraIndex => throw UnimplementedError();

  @override
  // TODO: implement selectedCameraIndexStream
  Stream<int> get selectedCameraIndexStream => throw UnimplementedError();

  @override
  // TODO: implement selectedCameraState
  FileCaptureCameraState get selectedCameraState => throw UnimplementedError();

  @override
  // TODO: implement selectedCameraStateStream
  Stream<FileCaptureCameraState> get selectedCameraStateStream =>
      throw UnimplementedError();

  @override
  // TODO: implement selectedCameraType
  FileCaptureCameraType get selectedCameraType => throw UnimplementedError();

  @override
  // TODO: implement selectedCameraTypeStream
  Stream<FileCaptureCameraType> get selectedCameraTypeStream =>
      throw UnimplementedError();

  @override
  switchFrontBackCamera() {
    // TODO: implement switchFrontBackCamera
    throw UnimplementedError();
  }
}
