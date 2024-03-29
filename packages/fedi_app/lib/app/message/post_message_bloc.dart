import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi_app/app/message/post_message_model.dart';
import 'package:fedi_app/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostMessageBloc implements IDisposable {
  static IPostMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostMessageBloc>(context, listen: listen);

  TextEditingController get inputTextController;

  FocusNode get inputFocusNode;

  IUploadMediaAttachmentsCollectionBloc get uploadMediaAttachmentsBloc;

  bool get isReadyToPost;

  int? get maximumMessageLength;

  Stream<bool> get isReadyToPostStream;

  bool get isInputFocused;

  Stream<bool> get isInputFocusedStream;

  String? get inputText;

  Stream<String?> get inputTextStream;

  List<FormItemValidationError>? get inputTextErrors;

  Stream<List<FormItemValidationError>> get inputTextErrorsStream;

  Future<void> post();

  void appendText(
    String textToAppend, {
    bool requestFocus = true,
  });

  PostMessageSelectedAction? get selectedAction;

  Stream<PostMessageSelectedAction?> get selectedActionStream;

  void toggleAttachActionSelection();

  void toggleEmojiActionSelection();

  void togglePollActionSelection();

  Stream<bool> get isAnySelectedActionVisibleStream;

  bool get isAnySelectedActionVisible;

  void clearSelectedAction();

  void onFileSelected();

  Stream<bool> get isExpandedStream;

  bool get isExpanded;

  void toggleExpanded();
}
