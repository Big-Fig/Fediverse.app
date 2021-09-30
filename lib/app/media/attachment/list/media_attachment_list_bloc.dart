import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IMediaAttachmentListBloc
    implements IDisposable, IInstanceLocationBloc {
  static IMediaAttachmentListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaAttachmentListBloc>(context, listen: listen);

  int get currentIndex;

  List<IUnifediApiMediaAttachment> get mediaAttachments;

  IUnifediApiMediaAttachment? get initialMediaAttachment;
}
