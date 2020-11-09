import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleMediaPickerBloc implements IDisposable {
  static ISingleMediaPickerBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<ISingleMediaPickerBloc>(context, listen: listen);


  MediaDeviceFileCallback get fileSelectedCallback;
}