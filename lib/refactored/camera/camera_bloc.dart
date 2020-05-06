import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/camera/camera_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

abstract class ICameraBloc
    implements Disposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static ICameraBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICameraBloc>(context, listen: listen);

  Stream<int> get selectedCameraIndexStream;

  int get selectedCameraIndex;

  Stream<CameraDescription> get cameraDescriptionStream;

  CameraDescription get cameraDescription;

  CameraController get cameraController;

  Stream<CameraController> get cameraControllerStream;

  Stream<CameraState> get cameraStateStream;

  CameraState get cameraState;

  Stream<bool> get isReadyForActionStream;

  bool get isReadyForAction;

  Stream<bool> get isVideoRecordingInProgressStream;

  bool get isVideoRecordingInProgress;

  Stream<bool> get isVideoRecordingInProgressOrPausedStream;

  bool get isVideoRecordingInProgressOrPaused;

  Stream<CameraLensDirection> get cameraLensDirectionStream;

  CameraLensDirection get cameraLensDirection;

  Stream<CameraConfig> get cameraConfigStream;

  CameraConfig get cameraConfig;

  bool get isFrontCameraSelected;

  bool get isBackCameraSelected;

  List<CameraDescription> get availableCameras;

  Stream<List<CameraDescription>> get availableCamerasStream;

  CameraFile get latestCapturedFile;

  Stream<CameraFile> get latestCapturedFileStream;

  int get videoRecordingTimeInSeconds;

  Stream<int> get videoRecordingTimeInSecondsStream;

  Future switchFrontBackCamera();

  Future chooseCameraByLensDirection(CameraLensDirection lensDirection);

  Future chooseCameraByIndex(int index);

  Future captureImage(String absolutePathToSave);

  Future changeConfig(CameraConfig newConfig);

  Future startVideoRecording(String absolutePathToSave);

  Future pauseVideoRecording();

  Future resumeVideoRecording();

  Future stopVideoRecording();

  static Future calculateUniquePathForImage(BuildContext context,
          {String extension = ".jpg"}) async =>
      await _calculateUniquePath(extension);

  static Future calculateUniquePathForVideo(BuildContext context,
          {String extension = ".mp4"}) async =>
      await _calculateUniquePath(extension);

  static Future<String> _calculateUniquePath(String extension) async {
    String dirPath = await calculateDirToSaveFiles();
    var timestamp = _timestamp();
    final String filePath = path.join(dirPath, "$timestamp$extension");

    return filePath;
  }

  static String _timestamp() =>
      DateTime.now().millisecondsSinceEpoch.toString();

  static Future<String> calculateDirToSaveFiles() async {
    final Directory extDir = await getTemporaryDirectory();
    final String dirPath = path.join(extDir.path, "camera_media");
    await Directory(dirPath).create(recursive: true);
    return dirPath;
  }
}
