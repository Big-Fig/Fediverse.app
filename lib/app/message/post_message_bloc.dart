import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostMessageBloc implements Disposable {
  static IPostMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostMessageBloc>(context, listen: listen);

  TextEditingController get inputTextController;

  FocusNode get inputFocusNode;

  IUploadMediaAttachmentsCollectionBloc get mediaAttachmentsBloc;

  bool get isReadyToPost;

  int get maximumMessageLength;

  Stream<bool> get isReadyToPostStream;

  String get inputText;

  Stream<String> get inputTextStream;

  Future<bool> post();

  void appendText(String textToAppend, {bool requestFocus = true});

  PostMessageSelectedAction get selectedAction;

  Stream<PostMessageSelectedAction> get selectedActionStream;

  void toggleAttachActionSelection();

  void toggleEmojiActionSelection();

  void togglePollActionSelection();

  Stream<bool> get isAnySelectedActionVisibleStream;

  bool get isAnySelectedActionVisible;

  void clearSelectedAction();
}
