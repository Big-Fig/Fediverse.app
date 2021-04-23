import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusBodyBloc implements IDisposable {
  static IStatusBodyBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBodyBloc>(context, listen: listen);

  bool get collapsible;

  IPleromaMediaAttachment? get initialMediaAttachment;
}
