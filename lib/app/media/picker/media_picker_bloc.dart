import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaPickerBloc extends IDisposable {
  static IMediaPickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaPickerBloc>(context, listen: listen);

  void onFileSelected(IMediaDeviceFile mediaDeviceFile);
}
