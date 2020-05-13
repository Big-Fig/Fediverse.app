import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_bloc_impl.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class UploadMediaAttachmentGridBloc extends DisposableOwner
    implements IUploadMediaAttachmentGridBloc {
  @override
  final int maximumMediaAttachmentCount;

  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;

  UploadMediaAttachmentGridBloc(
      {@required this.maximumMediaAttachmentCount,
      @required this.pleromaMediaAttachmentService}) {
    addDisposable(subject: mediaAttachmentBlocsSubject);
    addDisposable(disposable: CustomDisposable(() {
      clear();
    }));
  }

  // ignore: close_sinks
  BehaviorSubject<List<IUploadMediaAttachmentBloc>>
      mediaAttachmentBlocsSubject = BehaviorSubject.seeded([]);

  @override
  List<IUploadMediaAttachmentBloc> get mediaAttachmentBlocs =>
      mediaAttachmentBlocsSubject.value;

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get mediaAttachmentBlocsStream =>
      mediaAttachmentBlocsSubject.stream;

  @override
  bool get isMaximumMediaAttachmentCountReached => isMaximumAttachmentReached(
      mediaAttachmentBlocs: mediaAttachmentBlocs,
      maximumMediaAttachmentCount: maximumMediaAttachmentCount);

  @override
  Stream<bool> get isMaximumMediaAttachmentCountReachedStream =>
      mediaAttachmentBlocsStream.map((mediaAttachmentBlocs) =>
          isMaximumAttachmentReached(
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              maximumMediaAttachmentCount: maximumMediaAttachmentCount));

  @override
  bool get isPossibleToAttachMedia => !isMaximumMediaAttachmentCountReached;

  @override
  Stream<bool> get isPossibleToAttachMediaStream =>
      isMaximumMediaAttachmentCountReachedStream.map((value) => !value);

  @override
  void attachMedia(FilePickerFile filePickerFile) {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(filePickerFile);

    if (existedBloc == null) {
      var uploadMediaAttachmentBloc = UploadMediaAttachmentBloc(
          filePickerFile: filePickerFile,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService);
      uploadMediaAttachmentBloc.startUpload();
      mediaAttachmentBlocs.add(uploadMediaAttachmentBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }
  }

  @override
  void detachMedia(FilePickerFile filePickerFile) {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(filePickerFile);
    if (existedBloc != null) {
      existedBloc.dispose();
      mediaAttachmentBlocs.remove(existedBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }
  }

  IUploadMediaAttachmentBloc findMediaAttachmentBlocByFilePickerFile(
          FilePickerFile filePickerFile) =>
      mediaAttachmentBlocs.firstWhere((bloc) {
        return bloc.filePickerFile == filePickerFile;
      }, orElse: () => null);

  static bool isMaximumAttachmentReached(
          {@required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
          @required int maximumMediaAttachmentCount}) =>
      mediaAttachmentBlocs.length >= maximumMediaAttachmentCount;

  @override
  void clear() {
    mediaAttachmentBlocs.forEach((bloc) {
      bloc.dispose();
    });
    mediaAttachmentBlocs.clear();
    mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
  }
}
