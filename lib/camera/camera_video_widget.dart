import 'package:fedi/camera/camera_bloc.dart';
import 'package:fedi/camera/camera_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraVideoWidget extends CameraWidget {
  Widget buildControls(BuildContext context, ICameraBloc cameraBloc) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: <Widget>[
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
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildPauseButtonWidget(cameraBloc),
              )),
        ],
      ),
    );
  }

  Widget buildCameraVideoRecordingStartStopButtonWidget(
          BuildContext context, ICameraBloc cameraBloc) =>
      StreamBuilder<bool>(
          stream: cameraBloc.cameraReadyForActionStream,
          initialData: cameraBloc.selectedCameraReadyForAction,
          builder: (context, snapshot) {
            var readyForAction = snapshot.data;

            Future<Null> Function() pressed;
            if (readyForAction) {
              pressed = () async {
                var pathToSave =
                    await ICameraBloc.calculateUniquePathForImage(context);
                cameraBloc.captureImage(pathToSave);
              };
            }
            return IconButton(
              iconSize: 80,
              icon: Icon(Icons.radio_button_checked),
              onPressed: pressed,
            );
          });

  IconButton buildPauseButtonWidget(ICameraBloc cameraBloc) => IconButton(
        iconSize: 44,
        color: Colors.white,
        icon: Icon(Icons.pause_circle_outline),
        onPressed: () {
          cameraBloc.switchFrontBackCamera();
        },
      );
}
