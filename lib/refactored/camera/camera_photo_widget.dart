import 'package:camera/camera.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/refactored/camera/camera_bloc.dart';
import 'package:fedi/refactored/camera/camera_widget.dart';
import 'package:fedi/refactored/permission/grant_permission_widget.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPhotoWidget extends CameraWidget {


  Widget buildControls(BuildContext context, ICameraBloc cameraBloc) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: buildCameraCaptureImageButtonWidget(context,
                    cameraBloc)),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildSwitchCameraButtonWidget(cameraBloc),
                )),
          ],
        ),
      );
  }

  Widget buildCameraCaptureImageButtonWidget(
          BuildContext context, ICameraBloc cameraBloc) =>
      InitialDataStreamBuilder<bool>(
          stream: cameraBloc.isReadyForActionStream,
          initialData: cameraBloc.isReadyForAction,
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
}
