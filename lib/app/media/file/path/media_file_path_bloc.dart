import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaFilePathBloc implements IDisposable {
  static IMediaFilePathBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaFilePathBloc>(context, listen: listen);

  String? get path;

  String get name;

  String get extension;
}
