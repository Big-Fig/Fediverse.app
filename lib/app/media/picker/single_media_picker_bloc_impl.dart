import 'package:fedi/app/media/picker/single_media_picker_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';

class SingleMediaPickerBloc extends DisposableOwner
    implements ISingleMediaPickerBloc {
  @override
  final MediaDeviceFileCallback onFileSelectedCallback;
  SingleMediaPickerBloc({
    @required this.onFileSelectedCallback,
  });
}
