import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/ui/badge/fedi_bool_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class PleromaChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IPleromaChatRepository pleromaChatRepository;

  PleromaChatUnreadBadgeBloc({
    @required this.pleromaChatRepository,
  });

  @override
  Stream<bool> get badgeStream => pleromaChatRepository
      .watchTotalUnreadCount()
      .map((count) => count != null && count > 0);
}
