import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusBloc implements Disposable {
  static IPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusBloc>(context, listen: listen);

  List<IUploadMediaAttachmentBloc> get mediaAttachmentBlocs;

  Stream<List<IUploadMediaAttachmentBloc>> get mediaAttachmentBlocsStream;

  List<String> get mentionedAccts;

  Stream<List<String>> get mentionedAcctsStream;

  TextEditingController get inputTextController;

  bool get isPossibleToChangeVisibility;

  PleromaVisibility get visibility;

  Stream<PleromaVisibility> get visibilityStream;

  addMentionByAccount(IAccount account);

  removeMentionByAccount(IAccount account);

  removeMentionByAcct(String acct);

  changeVisibility(PleromaVisibility visibility);

  attachMedia(FilePickerFile filePickerFile);

  detachMedia(FilePickerFile filePickerFile);

  bool get isReadyToPost;

  Stream<bool> get isReadyToPostStream;

  bool get isPossibleToAttachMedia;

  Stream<bool> get isPossibleToAttachMediaStream;

  bool get isMaximumMediaAttachmentCountReached;

  Stream<bool> get isMaximumMediaAttachmentCountReachedStream;

  int get maximumMediaAttachmentCount;

  String get inputText;

  Stream<String> get inputTextStream;

  String get inputWithoutMentionedAcctsText;

  Stream<String> get inputWithoutMentionedAcctsTextStream;

  bool get isHaveMentionedAccts;

  Stream<bool> get isHaveMentionedAcctsStream;

  Future<IStatus> postStatus();
}
