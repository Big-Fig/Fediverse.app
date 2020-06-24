import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISingleFilePickerBloc implements IFilePickerBloc {
  static ISingleFilePickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISingleFilePickerBloc>(context, listen: listen);

}
