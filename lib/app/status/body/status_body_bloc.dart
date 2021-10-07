import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IStatusBodyBloc implements IDisposable {
  static IStatusBodyBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBodyBloc>(context, listen: listen);

  bool get collapsible;

  IUnifediApiMediaAttachment? get initialMediaAttachment;
}
