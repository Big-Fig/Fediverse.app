import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart' as Camera;
import 'package:camera/camera.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/camera/camera_bloc.dart';
import 'package:fedi/camera/camera_exception.dart';
import 'package:fedi/camera/camera_model.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/group_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

Logger _logger = Logger("camera_bloc_impl.dart");

const videoRecordingTimerRepeatDuration = Duration(seconds: 1);
var defaultVideoConfig = CameraConfig(
    audioEnabled: true,
    resolutionPreset: Camera.ResolutionPreset.high,
    maximumVideoDuration: null);
var defaultImageConfig = CameraConfig(
    audioEnabled: false,
    resolutionPreset: Camera.ResolutionPreset.high,
    maximumVideoDuration: null);

abstract class AbstractCameraBloc extends AsyncInitLoadingBloc
    implements ICameraBloc {
  int startCameraIndex;
  Camera.CameraLensDirection startCameraLensDirection;

  Timer _videoRecordingTimer;
  String _videoRecordingPath;

  GroupPermissionBloc _groupPermissionBloc;

  final ICameraPermissionBloc cameraPermissionBloc;
  final IMicPermissionBloc micPermissionBloc;
  List<IPermissionBloc> _permissionsToCheck;

  AbstractCameraBloc({
    @required ICameraPermissionBloc cameraPermissionBloc,
    @required IMicPermissionBloc micPermissionBloc,
    CameraConfig startConfig,
  }) : this.byCameraLensDirection(
            startConfig: startConfig,
            cameraPermissionBloc: cameraPermissionBloc,
            micPermissionBloc: micPermissionBloc);

  AbstractCameraBloc.byCameraLensDirection({
    @required this.cameraPermissionBloc,
    @required this.micPermissionBloc,
    this.startCameraLensDirection: Camera.CameraLensDirection.back,
    CameraConfig startConfig,
  }) {
    _constructor(startConfig);
  }

  AbstractCameraBloc.byCameraIndex(
      {@required this.cameraPermissionBloc,
      @required this.micPermissionBloc,
      this.startCameraIndex = 0,
      CameraConfig startConfig}) {
    _constructor(startConfig);
  }

  void _constructor(CameraConfig startConfig) {
    this._permissionsToCheck = [cameraPermissionBloc];
    var cameraConfig = startConfig ?? defaultVideoConfig;
    if (cameraConfig.audioEnabled) {
      _permissionsToCheck.add(micPermissionBloc);
    }
    this._groupPermissionBloc = GroupPermissionBloc(_permissionsToCheck);
    cameraConfigSubject = BehaviorSubject.seeded(cameraConfig);
    addDisposable(subject: latestCapturedFileSubject);
    addDisposable(subject: videoRecordingTimeInSecondsSubject);
    addDisposable(subject: cameraConfigSubject);
    addDisposable(subject: availableCamerasSubject);
    addDisposable(subject: selectedCameraIndexSubject);
    addDisposable(subject: cameraStateSubject);
  }
  // ignore: close_sinks
  BehaviorSubject<CameraFile> latestCapturedFileSubject =
  BehaviorSubject();

  CameraFile get latestCapturedFile => latestCapturedFileSubject.value;

  Stream<CameraFile> get latestCapturedFileStream =>
      latestCapturedFileSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<Camera.CameraController> cameraControllerSubject =
      BehaviorSubject();
  @override
  Camera.CameraController get cameraController => cameraControllerSubject.value;
  @override
  Stream<Camera.CameraController> get cameraControllerStream =>
      cameraControllerSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<List<Camera.CameraDescription>> availableCamerasSubject =
      BehaviorSubject();

  @override
  Stream<List<Camera.CameraDescription>> get availableCamerasStream =>
      availableCamerasSubject.stream;

  @override
  List<Camera.CameraDescription> get availableCameras =>
      availableCamerasSubject.value;

  // ignore: close_sinks
  BehaviorSubject<CameraConfig> cameraConfigSubject;
  @override
  Stream<CameraConfig> get cameraConfigStream => cameraConfigSubject.stream;

  @override
  CameraConfig get cameraConfig => cameraConfigSubject.value;

  // ignore: close_sinks
  BehaviorSubject<int> videoRecordingTimeInSecondsSubject = BehaviorSubject();

  @override
  int get videoRecordingTimeInSeconds =>
      videoRecordingTimeInSecondsSubject.value;

  @override
  Stream<int> get videoRecordingTimeInSecondsStream =>
      videoRecordingTimeInSecondsSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<int> selectedCameraIndexSubject = BehaviorSubject();

  @override
  Stream<int> get selectedCameraIndexStream =>
      selectedCameraIndexSubject.stream;

  @override
  int get selectedCameraIndex => selectedCameraIndexSubject.value;
  @override
  Stream<Camera.CameraDescription> get cameraDescriptionStream =>
      cameraControllerStream
          .map((cameraController) => cameraController?.description);

  @override
  Camera.CameraDescription get cameraDescription =>
      cameraController?.description;

  // ignore: close_sinks
  BehaviorSubject<CameraState> cameraStateSubject = BehaviorSubject();

  @override
  Stream<CameraState> get selectedCameraStateStream =>
      cameraStateSubject.stream;

  @override
  CameraState get cameraState => cameraStateSubject.value;

  Stream<bool> get cameraReadyForActionStream =>
      selectedCameraStateStream.map(mapCameraStateToReadyForAction);

  bool get selectedCameraReadyForAction =>
      mapCameraStateToReadyForAction(cameraState);

  @override
  Stream<CameraLensDirection> get cameraLensDirectionStream =>
      cameraDescriptionStream
          .map((cameraDescription) => cameraDescription?.lensDirection);

  @override
  CameraLensDirection get cameraLensDirection =>
      cameraDescription?.lensDirection;
  @override
  bool get isFrontCameraSelected =>
      cameraLensDirection == CameraLensDirection.front;
  @override
  bool get isBackCameraSelected =>
      cameraLensDirection == CameraLensDirection.back;

  void dispose() {
    super.dispose();

    _videoRecordingTimer?.cancel();

    cameraController?.dispose();
  }

  @override
  Future internalAsyncInit() async {
    await _groupPermissionBloc.performAsyncInit();

    if (_groupPermissionBloc.permissionGranted) {
      await _initAfterPermissionGranted();
    } else {
      addDisposable(
          streamSubscription: _groupPermissionBloc.permissionGrantedStream
              .distinct()
              .listen((granted) {
        if (granted && cameraController == null) {
          _initAfterPermissionGranted();
        }
      }));
    }
  }

  Future _initAfterPermissionGranted() async {
    List<Camera.CameraDescription> availableCameras;
    try {
      availableCameras = await loadAvailableCameras();
    } on Exception {
      throw CamerasListErrorException();
    }

    if (availableCameras.isEmpty) {
      throw CamerasListIsEmptyException();
    }

    availableCamerasSubject.add(availableCameras);

    assert(startCameraIndex != null || startCameraLensDirection != null);

    if (startCameraIndex != null) {
      await chooseCameraByIndex(startCameraIndex);
    } else if (startCameraLensDirection != null) {
      chooseCameraByLensDirection(startCameraLensDirection);
    }
  }

  Future<Camera.CameraController> _createAndInitCamera(
      Camera.CameraDescription cameraDescription, CameraConfig config) async {
    _logger.fine(() => "_createAndInitCamera start \n"
        "\t availableCameras $availableCameras \n"
        "\t config $config  \n");
    var oldCameraController = cameraController;
    var oldConfig = cameraConfig;
    var sameConfig = oldConfig?.audioEnabled != config.audioEnabled ||
        oldConfig?.resolutionPreset != config.resolutionPreset;
    var sameCamera = oldCameraController?.description == cameraDescription;
    if (sameCamera && sameConfig) {
      _logger.warning(() => "don't re-create camera with same config & camera"
          " descrption");
      return oldCameraController;
    }
    await _reset();
    cameraStateSubject.add(CameraState.initializing);

    var newCameraController = createCameraController(cameraDescription, config);
    await performCameraOperation(newCameraController.initialize);
    _logger.fine(() => "_createAndInitCamera finish \n"
        "\t newCameraController $newCameraController \n");
    cameraControllerSubject.add(newCameraController);

    cameraConfigSubject.add(config);
    selectedCameraIndexSubject.add(availableCameras.indexOf(cameraDescription));

    cameraStateSubject.add(CameraState.readyForAction);
    return newCameraController;
  }

  Future<T> performCameraOperation<T>(Future<T> asyncCameraOperation()) async {
    _logger.fine(() => "performCameraOperation value "
        "${cameraController?.value}");
    try {
      return await asyncCameraOperation();
    } on Exception catch (e) {
      _logger.shout(() => "performCameraOperation error "
          "$e");
      cameraStateSubject.add(CameraState.error);
      throw CameraErrorException(cameraDescription, selectedCameraIndex,
          cameraLensDirection, cameraState, e);
    }
  }

  @override
  Future switchFrontBackCamera() async {
    _logger.fine(() => "switchFrontBackCamera oldState $cameraState "
        "oldIndex $selectedCameraIndex");
    if (isFrontCameraSelected || isBackCameraSelected) {
      Camera.CameraDescription cameraDescription;
      if (isFrontCameraSelected) {
        cameraDescription = findCameraDescriptionByLens(
            availableCameras, CameraLensDirection.back);
      } else {
        cameraDescription = findCameraDescriptionByLens(
            availableCameras, CameraLensDirection.front);
      }
      _createAndInitCamera(cameraDescription, cameraConfig);
    } else {
      throw "You can't switch only between front & back camera. Currently "
          "selected is $cameraLensDirection";
    }
  }

  @override
  Future chooseCameraByIndex(int index) async {
    _logger.fine(() => "chooseCameraByIndex $index");
    var length = availableCameras.length;
    if (length <= index) {
      throw CameraByIndexNotExistException(availableCameras, index);
    } else {
      var cameraDescription = availableCameras[index];

      await _createAndInitCamera(cameraDescription, cameraConfig);
    }
  }

  @override
  Future chooseCameraByLensDirection(CameraLensDirection direction) async {
    _logger.fine(() => "chooseCameraByType $direction");
    if (direction == CameraLensDirection.front ||
        direction == CameraLensDirection.back) {
      var cameraDescription =
          findCameraDescriptionByLens(availableCameras, direction);
      if (cameraDescription == null) {
        throw CameraByLensDirectionNotExistException(
            direction, availableCameras);
      } else {
        await _createAndInitCamera(cameraDescription, cameraConfig);
      }
    } else {
      throw "You can't chooseCameraByType only front & back cameras."
          " Type $direction not supported";
    }
  }

  static CameraDescription findCameraDescriptionByLens(
          List<CameraDescription> cameras,
          CameraLensDirection cameraLensDirection) =>
      cameras.firstWhere(
          (camera) => camera.lensDirection == cameraLensDirection,
          orElse: () => null);

  static bool mapCameraStateToReadyForAction(CameraState state) =>
      state == CameraState.readyForAction;

  @override
  Future captureImage(String absolutePathToSave) async {
    _logger.fine(() => "captureImage start \n"
        "\t absolutePathToSave $absolutePathToSave");
    ensureCameraReadyForAction();
    cameraStateSubject.add(CameraState.imageCapturing);
    await performCameraOperation(
        () => cameraController.takePicture(absolutePathToSave));

    latestCapturedFileSubject.add(CameraFile(File(absolutePathToSave),
        CameraFileType.photo));

    _logger.fine(() => "captureImage finish \n"
        "\t absolutePathToSave $absolutePathToSave");
    cameraStateSubject.add(CameraState.readyForAction);
  }

  @override
  Future pauseVideoRecording() async {
    if (cameraState == CameraState.videoRecording) {
      await performCameraOperation(() => cameraController.stopVideoRecording());

      cameraStateSubject.add(CameraState.videoPaused);
    } else {
      throw CameraNotReadyException(cameraDescription, selectedCameraIndex,
          cameraLensDirection, cameraState, [CameraState.videoRecording]);
    }
  }

  @override
  Future resumeVideoRecording() async {
    if (cameraState == CameraState.videoPaused) {
      await performCameraOperation(
          () => cameraController.resumeVideoRecording());

      cameraStateSubject.add(CameraState.videoRecording);
    } else {
      throw CameraNotReadyException(cameraDescription, selectedCameraIndex,
          cameraLensDirection, cameraState, [CameraState.videoPaused]);
    }
  }

  @override
  Future startVideoRecording(String absolutePathToSave) async {
    ensureCameraReadyForAction();
    _videoRecordingPath = absolutePathToSave;
    await performCameraOperation(
        () => cameraController.startVideoRecording(absolutePathToSave));
    _videoRecordingTimer = Timer.periodic(
        videoRecordingTimerRepeatDuration, videoRecordingPeriodicCallback);
    cameraStateSubject.add(CameraState.videoRecording);
  }

  void videoRecordingPeriodicCallback(Timer timer) {
    if (cameraState == CameraState.videoRecording) {
      var previousTimeInSeconds = videoRecordingTimeInSeconds ?? 0;
      var newTimeInSeconds =
          previousTimeInSeconds + videoRecordingTimerRepeatDuration.inSeconds;
      videoRecordingTimeInSecondsSubject.add(newTimeInSeconds);

      var maxVideoDurationInSeconds =
          cameraConfig.maximumVideoDuration?.inSeconds;
      if (maxVideoDurationInSeconds != null) {
        if (maxVideoDurationInSeconds < newTimeInSeconds) {
          stopVideoRecording();
        }
      }
    }
  }

  @override
  Future stopVideoRecording() async {
    if (cameraState == CameraState.videoRecording ||
        cameraState == CameraState.videoPaused) {
      await performCameraOperation(() => cameraController.stopVideoRecording());

      latestCapturedFileSubject.add(CameraFile(File(_videoRecordingPath),
          CameraFileType.video));
      _resetVideoRecording();
      cameraStateSubject.add(CameraState.readyForAction);
    } else {
      throw CameraNotReadyException(
          cameraDescription,
          selectedCameraIndex,
          cameraLensDirection,
          cameraState,
          [CameraState.videoRecording, CameraState.videoPaused]);
    }
  }

  void ensureCameraReadyForAction() {
    if (!selectedCameraReadyForAction) {
      throw CameraNotReadyException(cameraDescription, selectedCameraIndex,
          cameraLensDirection, cameraState, [CameraState.readyForAction]);
    }
  }

  Future _reset() async {
    cameraStateSubject.add(CameraState.disposed);
    var controller = cameraController;
    _logger.fine(() => "_reset controller = $controller");
    cameraControllerSubject.add(null);
    if (controller != null) {
      await controller.dispose();
    }
    _resetVideoRecording();
  }

  void _resetVideoRecording() {
    videoRecordingTimeInSecondsSubject.add(null);
    if (_videoRecordingTimer != null) {
      _videoRecordingTimer.cancel();
      _videoRecordingTimer = null;
    }
    _videoRecordingPath = null;
  }

  @override
  Future changeConfig(CameraConfig newConfig) async {
    ensureCameraReadyForAction();
    await _createAndInitCamera(cameraDescription, newConfig);

    if (cameraConfig.audioEnabled != newConfig.audioEnabled) {
      if (newConfig.audioEnabled) {
        _permissionsToCheck.add(micPermissionBloc);
      } else {
        _permissionsToCheck.remove(micPermissionBloc);
      }
      checkPermissionStatus();
    }
  }

  @override
  Future<PermissionStatus> checkPermissionStatus() =>
      _groupPermissionBloc.checkPermissionStatus();

  @override
  bool get permissionGranted => _groupPermissionBloc.permissionGranted;

  @override
  Stream<bool> get permissionGrantedStream =>
      _groupPermissionBloc.permissionGrantedStream;

  @override
  PermissionStatus get permissionStatus =>
      _groupPermissionBloc.permissionStatus;

  @override
  Stream<PermissionStatus> get permissionStatusStream =>
      _groupPermissionBloc.permissionStatusStream;

  @override
  Future<PermissionStatus> requestPermission() =>
      _groupPermissionBloc.requestPermission();

  Future<List<Camera.CameraDescription>> loadAvailableCameras();

  Camera.CameraController createCameraController(
      Camera.CameraDescription cameraByIndex, CameraConfig config);
}

class CameraBloc extends AbstractCameraBloc {
  Future<List<Camera.CameraDescription>> loadAvailableCameras() async =>
      await Camera.availableCameras();

  Camera.CameraController createCameraController(
      Camera.CameraDescription cameraByIndex, CameraConfig config) {
    return Camera.CameraController(cameraByIndex, config.resolutionPreset,
        enableAudio: config.audioEnabled);
  }

  CameraBloc({
    @required ICameraPermissionBloc cameraPermissionBloc,
    @required IMicPermissionBloc micPermissionBloc,
    CameraConfig startConfig,
  }) : super(
            startConfig: startConfig,
            cameraPermissionBloc: cameraPermissionBloc,
            micPermissionBloc: micPermissionBloc);

  CameraBloc.byCameraLensDirection({
    @required ICameraPermissionBloc cameraPermissionBloc,
    @required IMicPermissionBloc micPermissionBloc,
    CameraLensDirection startCameraLensDirection = CameraLensDirection.back,
    CameraConfig startConfig,
  }) : super.byCameraLensDirection(
            cameraPermissionBloc: cameraPermissionBloc,
            micPermissionBloc: micPermissionBloc,
            startCameraLensDirection: startCameraLensDirection,
            startConfig: startConfig);

  CameraBloc.byCameraIndex(
      {@required ICameraPermissionBloc cameraPermissionBloc,
      @required IMicPermissionBloc micPermissionBloc,
      int startCameraIndex,
      CameraConfig startConfig})
      : super.byCameraIndex(
            cameraPermissionBloc: cameraPermissionBloc,
            micPermissionBloc: micPermissionBloc,
            startCameraIndex: startCameraIndex,
            startConfig: startConfig);
}
