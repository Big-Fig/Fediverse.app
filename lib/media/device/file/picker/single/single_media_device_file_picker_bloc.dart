import 'package:fedi/media/device/file/picker/media_device_file_picker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleMediaDeviceFilePickerBloc implements IMediaDeviceFilePickerBloc {
  static ISingleMediaDeviceFilePickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISingleMediaDeviceFilePickerBloc>(context, listen: listen);
}
