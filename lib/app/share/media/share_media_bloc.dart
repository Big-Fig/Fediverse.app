import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareMediaBloc {
  static IShareMediaBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareMediaBloc>(context, listen: listen);

  IPleromaMediaAttachment? get mediaAttachment;
}
