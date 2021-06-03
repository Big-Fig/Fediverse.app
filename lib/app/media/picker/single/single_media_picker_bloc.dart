import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleMediaPickerBloc implements IMediaPickerBloc {
  static ISingleMediaPickerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISingleMediaPickerBloc>(context, listen: listen);

  Stream<IMediaDeviceFile> get fileSelectionStream;
}
