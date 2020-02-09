import 'package:camera/camera.dart' as Camera;
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_bloc.dart';
import 'package:fedi/file/capture/camera/file_capture_camera_model.dart';
import 'package:rxdart/rxdart.dart';

// It should be always true, at least on all popular devices
const _frontCameraTypeIndex = 1;
const _backCameraTypeIndex = 0;

class FileCaptureCameraBloc extends AsyncInitLoadingBloc
    implements IFileCaptureCameraBloc {
  final int startCameraIndex;

  FileCaptureCameraBloc() : this.byCameraType();

  FileCaptureCameraBloc.byCameraType(
      {FileCaptureCameraType startCameraType = FileCaptureCameraType.back})
      : this.byCameraIndex(
            startCameraIndex: mapCameraTypeToIndex(startCameraType));

  FileCaptureCameraBloc.byCameraIndex(
      {this.startCameraIndex = _backCameraTypeIndex});

  @override
  Future internalAsyncInit() async {
    List<Camera.CameraDescription> availableCameras;
    try {
      availableCameras = await Camera.availableCameras();
    } on Exception {
      throw "Can't init. error during fetching available cameras";
    }

    if (availableCameras.isEmpty) {
      throw "Can't init. availableCameras is empty";
    }

    if (availableCameras.length <= startCameraIndex) {
      throw "Can't init."
          " Start camera index($startCameraIndex) is more than"
          " availableCameras.length = ${availableCameras.length}";
    }

    availableCamerasSubject = BehaviorSubject.seeded(availableCameras);
    addDisposable(subject: availableCamerasSubject);
    this.controller = Camera.CameraController(
        availableCameras[startCameraIndex], Camera.ResolutionPreset.high);

    await controller.initialize();
  }

  @override
  Camera.CameraController controller;

  // ignore: close_sinks
  BehaviorSubject<List<Camera.CameraDescription>> availableCamerasSubject;

  @override
  Stream<List<Camera.CameraDescription>> get availableCamerasStream =>
      availableCamerasSubject.stream;

  @override
  List<Camera.CameraDescription> get availableCameras =>
      availableCamerasSubject.value;

  // ignore: close_sinks
  BehaviorSubject<int> selectedCameraIndexSubject;

  @override
  Stream<int> get selectedCameraIndexStream =>
      selectedCameraIndexSubject.stream;

  @override
  int get selectedCameraIndex => selectedCameraIndexSubject.value;

  // ignore: close_sinks
  BehaviorSubject<FileCaptureCameraState> selectedCameraStateSubject;

  @override
  Stream<FileCaptureCameraState> get selectedCameraStateStream =>
      selectedCameraStateSubject.stream;

  @override
  FileCaptureCameraState get selectedCameraState =>
      selectedCameraStateSubject.value;

  @override
  Stream<FileCaptureCameraType> get selectedCameraTypeStream =>
      selectedCameraIndexStream.map(mapCameraIndexToType);

  @override
  FileCaptureCameraType get selectedCameraType =>
      mapCameraIndexToType(selectedCameraIndexSubject.value);

  @override
  switchFrontBackCamera() {
    throw UnimplementedError();
  }

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

  static FileCaptureCameraType mapCameraIndexToType(int cameraIndex) {
    FileCaptureCameraType type;
    switch (cameraIndex) {
      case _frontCameraTypeIndex:
        type = FileCaptureCameraType.front;
        break;
      case _backCameraTypeIndex:
        type = FileCaptureCameraType.back;
        break;
      default:
        type = FileCaptureCameraType.other;
        break;
    }
    return type;
  }

  static mapCameraTypeToIndex(FileCaptureCameraType cameraType) {
    int index;
    switch (cameraType) {
      case FileCaptureCameraType.front:
        index = _frontCameraTypeIndex;
        break;
      case FileCaptureCameraType.back:
        index = _backCameraTypeIndex;
        break;
      default:
        throw "Invalid cameraType $cameraType";
        break;
    }
    return index;
  }
}
