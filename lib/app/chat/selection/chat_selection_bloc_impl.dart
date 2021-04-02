import 'package:collection/collection.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

final _dateFormat = DateFormat("yyyy-MM-dd HH:mm");

class ChatSelectionBloc extends DisposableOwner implements IChatSelectionBloc {
  final IMyAccountBloc myAccountBloc;

  BehaviorSubject<List<IChatMessage>> currentChatMessagesSelectionSubject =
      BehaviorSubject.seeded([]);

  ChatSelectionBloc({
    required this.myAccountBloc,
  }) {
    addDisposable(subject: currentChatMessagesSelectionSubject);
  }

  @override
  bool get isAllSelectedItemsFromMe => _calculateIsAllSelectedItemsFromMe(
        currentSelection: currentSelection,
        myAccountBloc: myAccountBloc,
      );

  @override
  Stream<bool> get isAllSelectedItemsFromMeStream => currentSelectionStream.map(
        (currentSelection) => _calculateIsAllSelectedItemsFromMe(
          currentSelection: currentSelection,
          myAccountBloc: myAccountBloc,
        ),
      );

  static bool _calculateIsAllSelectedItemsFromMe({
    required List<IChatMessage> currentSelection,
    required IMyAccountBloc myAccountBloc,
  }) {
    return currentSelection.fold(
      true,
      (previousValue, element) =>
          previousValue && myAccountBloc.checkIsChatMessageFromMe(element),
    );
  }

  @override
  List<IChatMessage> get currentSelection =>
      currentChatMessagesSelectionSubject.value!;

  @override
  Stream<List<IChatMessage>> get currentSelectionStream =>
      currentChatMessagesSelectionSubject.stream;

  @override
  bool get isSomethingSelected => _calculateIsSomethingSelected(
        currentChatMessagesSelection: currentSelection,
      );

  @override
  Stream<bool> get isSomethingSelectedStream => currentSelectionStream.map(
        (currentChatMessagesSelection) => _calculateIsSomethingSelected(
          currentChatMessagesSelection: currentChatMessagesSelection,
        ),
      );

  @override
  int get selectedItemsCount => _calculateSelectedItemsCount(
        currentChatMessagesSelection: currentSelection,
      );

  @override
  Stream<int> get selectedItemsCountStream => currentSelectionStream.map(
        (currentChatMessagesSelection) => _calculateSelectedItemsCount(
          currentChatMessagesSelection: currentChatMessagesSelection,
        ),
      );

  static bool _calculateIsSomethingSelected({
    required List<IChatMessage?>? currentChatMessagesSelection,
  }) =>
      currentChatMessagesSelection?.isNotEmpty == true;

  static int _calculateSelectedItemsCount({
    required List<IChatMessage?>? currentChatMessagesSelection,
  }) =>
      currentChatMessagesSelection?.length ?? 0;

  @override
  String calculateSelectionAsRawText() {
    var rawText = currentSelection.map((chatMessage) {
      var chatMessageText = "";
      chatMessageText += chatMessage.account.acct;
      chatMessageText += " ";
      chatMessageText += "(${chatMessage.account.displayName})";
      chatMessageText += " ";
      chatMessageText += "${_dateFormat.format(chatMessage.createdAt)}";
      if (chatMessage.content?.isNotEmpty == true) {
        chatMessageText += "\n";
        chatMessageText += chatMessage.content!;
      }

      if (chatMessage.mediaAttachments?.isNotEmpty == true) {
        chatMessageText += "\n";
        chatMessageText += "[";
        chatMessageText += chatMessage.mediaAttachments!
            .map(
              (mediaAttachment) => mediaAttachment.url,
            )
            .join(", ");
        chatMessageText += "]";
      }
      return chatMessageText;
    }).join("\n\n");

    return rawText;
  }

  @override
  void clearSelection() {
    currentChatMessagesSelectionSubject.add([]);
  }

  @override
  void addItemToSelection(IChatMessage chatMessage) {
    currentChatMessagesSelectionSubject.add(
      [
        ...currentSelection,
        chatMessage,
      ],
    );
  }

  @override
  void removeItemFromSelection(IChatMessage chatMessage) {
    currentChatMessagesSelectionSubject.add(
      currentSelection
          .where((currentChatMessage) =>
              currentChatMessage.remoteId != chatMessage.remoteId)
          .toList(),
    );
  }

  @override
  void toggleItemSelected(IChatMessage chatMessage) {
    var chatMessageSelected = isItemSelected(chatMessage);

    if (chatMessageSelected) {
      addItemToSelection(chatMessage);
    } else {
      removeItemFromSelection(chatMessage);
    }
  }

  @override
  bool isItemSelected(IChatMessage chatMessage) =>
      _calculateIsChatMessageSelected(
        currentChatMessagesSelection: currentSelection,
        chatMessageRemoteId: chatMessage.remoteId,
      );

  @override
  Stream<bool> isItemSelectedStream(IChatMessage chatMessage) =>
      currentSelectionStream.map(
        (currentChatMessagesSelection) => _calculateIsChatMessageSelected(
          currentChatMessagesSelection: currentChatMessagesSelection,
          chatMessageRemoteId: chatMessage.remoteId,
        ),
      );

  static bool _calculateIsChatMessageSelected({
    required List<IChatMessage> currentChatMessagesSelection,
    required String chatMessageRemoteId,
  }) {
    var found = findChatMessageByRemoteId(
      currentChatMessagesSelection: currentChatMessagesSelection,
      chatMessageRemoteId: chatMessageRemoteId,
    );

    return found != null;
  }

  static IChatMessage? findChatMessageByRemoteId({
    required List<IChatMessage> currentChatMessagesSelection,
    required String chatMessageRemoteId,
  }) {
    var found = currentChatMessagesSelection.firstWhereOrNull(
      (currentChatMessage) =>
          currentChatMessage.remoteId == chatMessageRemoteId,
    );

    return found;
  }

  static ChatSelectionBloc createFromContext(
    BuildContext context,
  ) =>
      ChatSelectionBloc(
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IChatSelectionBloc>(
        create: (context) => ChatSelectionBloc.createFromContext(
          context,
        ),
        child: child,
      );
}
