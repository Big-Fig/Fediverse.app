import 'dart:io';

import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaPickerService extends IDisposable {
  static IMediaPickerService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaPickerService>(context, listen: listen);

  Future<File> pickImageFromCamera();

  Future<File> pickVideoFromCamera();
}
