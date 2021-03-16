import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareMediaBloc {
  static IShareMediaBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareMediaBloc>(context, listen: listen);

  IPleromaMediaAttachment? get mediaAttachment;
}
