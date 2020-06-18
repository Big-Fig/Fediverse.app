import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc_impl.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

class ChatMessagesHomeTabBloc extends DisposableOwner
    implements IChatMessagesHomeTabBloc {
  @override
  NestedScrollController nestedScrollController;

  @override
  INestedScrollControllerBloc nestedScrollControllerBloc;

  @override
  IFediNestedScrollViewBloc fediNestedScrollViewBloc;

  ChatMessagesHomeTabBloc() {

    nestedScrollControllerBloc = NestedScrollControllerBloc(
        nestedScrollController: nestedScrollController);
    fediNestedScrollViewBloc = FediNestedScrollViewBloc(
        nestedScrollControllerBloc: nestedScrollControllerBloc);

    addDisposable(scrollController: nestedScrollController);
    addDisposable(disposable: nestedScrollControllerBloc);
    addDisposable(disposable: fediNestedScrollViewBloc);
  }

  @override
  void scrollToTop() {
    nestedScrollControllerBloc.scrollToTop();
  }
}
