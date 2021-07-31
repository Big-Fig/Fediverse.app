import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusBodyBloc implements IDisposable {
  static IStatusBodyBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBodyBloc>(context, listen: listen);

  bool get collapsible;

  IPleromaApiMediaAttachment? get initialMediaAttachment;
}
