import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaAttachmentListBloc
    implements IDisposable, IInstanceLocationBloc {
  static IMediaAttachmentListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaAttachmentListBloc>(context, listen: listen);

  int get currentIndex;

  List<IPleromaApiMediaAttachment> get mediaAttachments;

  IPleromaApiMediaAttachment? get initialMediaAttachment;
}
