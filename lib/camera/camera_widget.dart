import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/camera/camera_bloc.dart';
import 'package:fedi/camera/camera_model.dart';
import 'package:fedi/permission/grant_permission_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CameraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cameraBloc = ICameraBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => GrantPermissionWidget(
        grantedBuilder: (context) =>
            buildPermissionGrantedView(context, cameraBloc),
        permissionBloc: cameraBloc,
      ),
      asyncInitLoadingBloc: cameraBloc,
    );
  }

  Widget buildPermissionGrantedView(
      BuildContext context, ICameraBloc cameraBloc) {
    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(child: buildCameraPreviewWidget(cameraBloc))),
        buildControls(context, cameraBloc),
      ],
    );
  }

  Widget buildSwitchCameraButtonWidget(ICameraBloc cameraBloc) =>
      StreamBuilder<bool>(
          stream: cameraBloc.isReadyForActionStream,
          initialData: cameraBloc.isReadyForAction,
          builder: (context, snapshot) {
            var readyForAction = snapshot.data;

            Widget widget;
            if (readyForAction) {
              widget = IconButton(
                iconSize: 44,
                color: Colors.white,
                icon: Icon(Icons.sync),
                onPressed: () {
                  cameraBloc.switchFrontBackCamera();
                },
              );
            } else {
              widget = SizedBox.shrink();
            }
            return widget;
          });

  Column buildCameraPreviewContainerWidget(ICameraBloc cameraBloc) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: buildCameraPreviewWidget(cameraBloc),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCameraPreviewWidget(ICameraBloc cameraBloc) {
    return Stack(
      children: <Widget>[
        StreamBuilder<CameraController>(
            stream: cameraBloc.cameraControllerStream,
            initialData: cameraBloc.cameraController,
            builder: (context, snapshot) {
              var cameraController = snapshot.data;

              if (cameraController != null) {
                return Center(
                  child: AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController)),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
        Align(
          alignment: Alignment.center,
          child: StreamBuilder<CameraState>(
              stream: cameraBloc.cameraStateStream,
              initialData: cameraBloc.cameraState,
              builder: (context, snapshot) {
                var state = snapshot.data;

                Widget widget;

                switch (state) {
                  case CameraState.error:
                    widget = Text(
                        AppLocalizations.of(context).tr("camera.state.error"));
                    break;
                  case CameraState.initializing:
                    widget = Text(AppLocalizations.of(context)
                        .tr("camera.state.initializing"));
                    break;
                  case CameraState.videoRecording:
                    widget = SizedBox.shrink();
                    break;
                  case CameraState.videoPaused:
                    widget = SizedBox.shrink();
                    break;
                  case CameraState.imageCapturing:
                    widget = CircularProgressIndicator();
                    break;
                  case CameraState.readyForAction:
                    widget = SizedBox.shrink();
                    break;
                  default:
                    widget = Text(AppLocalizations.of(context)
                        .tr("camera.state.not_initialized"));
                    break;
                }

                return widget;
              }),
        ),
      ],
    );
  }

  Widget buildControls(BuildContext context, ICameraBloc cameraBloc);
}
