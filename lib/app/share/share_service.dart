import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareService implements Disposable {
  static IShareService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IShareService>(context, listen: listen);

  Future shareMediaAttachment(
      {@required BuildContext context,
      @required String popupTitle,
      IPleromaMediaAttachment mediaAttachment});

  Future shareStatus(
      {@required BuildContext context,
      @required String popupTitle,
      @required IStatus status});
}
