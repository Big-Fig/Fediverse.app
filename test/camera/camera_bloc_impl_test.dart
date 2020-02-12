import 'package:fedi/camera/camera_bloc_impl.dart';
import 'package:fedi/camera/camera_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('mapCameraTypeToIndex', () {
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.readyForAction),
        true);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.videoRecording),
        false);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.videoPaused),
        false);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.initializing),
        false);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.error),
        false);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(CameraState.imageCapturing),
        false);
    expect(
        AbstractCameraBloc.mapCameraStateToReadyForAction(null),
        false);
  });
}
