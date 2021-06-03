import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IExternalShareService implements IDisposable {
  static IExternalShareService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IExternalShareService>(context, listen: listen);

  Future share({
    required String popupTitle,
    required String? text,
    required List<ShareUrlFile>? urlFiles,
  });
}
