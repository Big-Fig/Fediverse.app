import 'package:fedi/camera/camera_bloc.dart';
import 'package:fedi/camera/camera_model.dart';
import 'package:fedi/camera/camera_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraVideoWidget extends CameraWidget {
  @override
  Widget buildControls(BuildContext context, ICameraBloc cameraBloc) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: buildVideoLengthCounterText(context, cameraBloc)),
          Align(
              alignment: Alignment.bottomCenter,
              child: buildCameraVideoRecordingStartStopButtonWidget(
                  context, cameraBloc)),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildSwitchCameraButtonWidget(cameraBloc),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildStopButtonWidget(cameraBloc),
              )),
        ],
      ),
    );
  }

  Widget buildVideoLengthCounterText(
          BuildContext context, ICameraBloc cameraBloc) =>
      StreamBuilder<bool>(
          stream: cameraBloc.isVideoRecordingInProgressOrPausedStream,
          initialData: cameraBloc.isVideoRecordingInProgressOrPaused,
          builder: (context, snapshot) {
            var isVideoRecordingInProgressOrPaused = snapshot.data;
            if (isVideoRecordingInProgressOrPaused) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<int>(
                          stream: cameraBloc.videoRecordingTimeInSecondsStream,
                          initialData: cameraBloc.videoRecordingTimeInSeconds,
                          builder: (context, snapshot) {
                            var videoRecordingTimeInSeconds = snapshot.data;

                            const secondsInMinute = 60;
                            var minutes =
                                videoRecordingTimeInSeconds ~/ secondsInMinute;
                            var seconds =
                                videoRecordingTimeInSeconds % secondsInMinute;
                            // TODO: refactor with number format
                            var secondsFormatted =
                                seconds < 10 ? "0$seconds" : "$seconds";
                            return Text(
                              "$minutes:$secondsFormatted",
                              style: TextStyle(color: Colors.white),
                            );
                          }),
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          });

  Widget buildCameraVideoRecordingStartStopButtonWidget(
          BuildContext context, ICameraBloc cameraBloc) =>
      StreamBuilder<CameraState>(
          stream: cameraBloc.cameraStateStream,
          initialData: cameraBloc.cameraState,
          builder: (context, snapshot) {
            var cameraState = snapshot.data;

            switch (cameraState) {
              case CameraState.readyForAction:
                return buildStartRecordingButton(
                    cameraBloc: cameraBloc, isEnabled: true, context: context);
                break;
              case CameraState.videoRecording:
                return buildPauseRecordingButton(cameraBloc: cameraBloc);
                break;
              case CameraState.videoPaused:
                return buildResumeRecordingButton(cameraBloc: cameraBloc);
                break;
              case CameraState.initializing:
              case CameraState.imageCapturing:
              case CameraState.disposed:
              case CameraState.error:
                return buildStartRecordingButton(
                    cameraBloc: cameraBloc, isEnabled: true, context: context);
                break;
            }
            throw "Invalid camera state $cameraState";
          });

  IconButton buildStartRecordingButton(
      {@required BuildContext context,
      @required ICameraBloc cameraBloc,
      @required bool isEnabled}) {
    Future<Null> Function() pressed;
    if (isEnabled) {
      pressed = () async {
        var pathToSave = await ICameraBloc.calculateUniquePathForImage(context);
        await cameraBloc.startVideoRecording(pathToSave);
      };
    }
    return IconButton(
      iconSize: 80,
      icon: Icon(Icons.radio_button_checked),
      onPressed: pressed,
    );
  }

  IconButton buildPauseRecordingButton({@required ICameraBloc cameraBloc}) =>
      IconButton(
        iconSize: 80,
        icon: Icon(Icons.pause_circle_outline),
        onPressed: () async {
          await cameraBloc.pauseVideoRecording();
        },
      );
  IconButton buildResumeRecordingButton({@required ICameraBloc cameraBloc}) =>
      IconButton(
        iconSize: 80,
        icon: Icon(Icons.play_circle_outline),
        onPressed: () async {
          await cameraBloc.resumeVideoRecording();
        },
      );

  Widget buildStopButtonWidget(ICameraBloc cameraBloc) => StreamBuilder<bool>(
      stream: cameraBloc.isVideoRecordingInProgressOrPausedStream,
      initialData: cameraBloc.isVideoRecordingInProgressOrPaused,
      builder: (context, snapshot) {
        var isVideoRecordingInProgressOrPaused = snapshot.data;
        if (isVideoRecordingInProgressOrPaused) {
          return IconButton(
            iconSize: 44,
            color: Colors.red,
            icon: Icon(Icons.stop),
            onPressed: () {
              cameraBloc.stopVideoRecording();
            },
          );
        } else {
          return SizedBox.shrink();
        }
      });
}
