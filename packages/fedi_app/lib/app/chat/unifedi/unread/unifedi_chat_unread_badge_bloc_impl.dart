import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';

class UnifediChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IUnifediChatRepository unifediChatRepository;

  UnifediChatUnreadBadgeBloc({
    required this.unifediChatRepository,
  });

  @override
  Stream<bool> get badgeStream =>
      unifediChatRepository.watchTotalUnreadCount().map((count) => count > 0);
}
