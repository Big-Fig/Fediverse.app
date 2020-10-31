import 'package:fedi/app/status/body/status_body_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';

class StatusBodyBloc extends DisposableOwner implements IStatusBodyBloc {
  @override
  final bool collapsible;
  @override
  final IPleromaMediaAttachment initialMediaAttachment;

  StatusBodyBloc({
    @required this.collapsible,
    @required this.initialMediaAttachment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusBodyBloc &&
          runtimeType == other.runtimeType &&
          collapsible == other.collapsible &&
          initialMediaAttachment == other.initialMediaAttachment;

  @override
  int get hashCode => collapsible.hashCode ^ initialMediaAttachment.hashCode;
}
