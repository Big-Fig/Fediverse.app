import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICameraMediaService extends IDisposable {
  static ICameraMediaService of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICameraMediaService>(context, listen: listen);

  Future<File?> pickImageFromCamera();

  Future<File?> pickVideoFromCamera();
}
