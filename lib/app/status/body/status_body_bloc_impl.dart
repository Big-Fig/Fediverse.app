import 'package:fedi/app/status/body/status_body_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';

class StatusBodyBloc extends DisposableOwner implements IStatusBodyBloc {
  @override
  final bool collapsible;
  @override
  final IPleromaApiMediaAttachment? initialMediaAttachment;

  StatusBodyBloc({
    required this.collapsible,
    required this.initialMediaAttachment,
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
