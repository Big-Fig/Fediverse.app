import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class UploadMediaAttachmentsCollectionBloc extends DisposableOwner
    implements IUploadMediaAttachmentsCollectionBloc {
  @override
  final int maximumMediaAttachmentCount;

  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;

  DisposableOwner uploadedSubscription;

  UploadMediaAttachmentsCollectionBloc(
      {@required this.maximumMediaAttachmentCount,
      @required this.pleromaMediaAttachmentService}) {
    addDisposable(subject: mediaAttachmentBlocsSubject);
    addDisposable(subject: isAllAttachedMediaUploadedSubject);
    addDisposable(disposable: CustomDisposable(() {
      clear();
    }));
    addDisposable(disposable: CustomDisposable(() {
      uploadedSubscription?.dispose();
    }));

    addDisposable(streamSubscription:
        mediaAttachmentBlocsStream.listen((mediaAttachmentBlocs) {
      uploadedSubscription?.dispose();
      uploadedSubscription = DisposableOwner();
      mediaAttachmentBlocs.forEach((bloc) {
        uploadedSubscription.addDisposable(
            streamSubscription: bloc.uploadStateStream.listen((_) {
          _recalculateIsAllAttachedMediaUploaded();
        }));
      });
    }));
  }

  // ignore: close_sinks
  BehaviorSubject<List<IUploadMediaAttachmentBloc>>
      mediaAttachmentBlocsSubject = BehaviorSubject.seeded([]);

  // ignore: close_sinks
  BehaviorSubject<bool> isAllAttachedMediaUploadedSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isAllAttachedMediaUploaded =>
      isAllAttachedMediaUploadedSubject.value;

  @override
  Stream<bool> get isAllAttachedMediaUploadedStream =>
      isAllAttachedMediaUploadedSubject.stream;

  @override
  List<IUploadMediaAttachmentBloc> get onlyMediaAttachmentBlocs =>
      mediaAttachmentBlocs
          ?.where((bloc) => bloc.filePickerFile.isMedia)
          ?.toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get onlyMediaAttachmentBlocsStream =>
      mediaAttachmentBlocsSubject.stream.map((mediaAttachmentBlocs) =>
          mediaAttachmentBlocs
              ?.where((bloc) => bloc.filePickerFile.isMedia)
              ?.toList());

  @override
  List<IUploadMediaAttachmentBloc> get onlyNonMediaAttachmentBlocs =>
      mediaAttachmentBlocs
          ?.where((bloc) => !bloc.filePickerFile.isMedia)
          ?.toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>>
      get onlyNonMediaAttachmentBlocsStream =>
          mediaAttachmentBlocsSubject.stream.map((mediaAttachmentBlocs) =>
              mediaAttachmentBlocs
                  ?.where((bloc) => !bloc.filePickerFile.isMedia)
                  ?.toList());

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
  List<IUploadMediaAttachmentBloc> get mediaAttachmentBlocs =>
      mediaAttachmentBlocsSubject.value;

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get mediaAttachmentBlocsStream =>
      mediaAttachmentBlocsSubject.stream;

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

  void _recalculateIsAllAttachedMediaUploaded() {
    var allUploaded = mediaAttachmentBlocs.fold(
        true,
        (previousValue, element) =>
            previousValue &&
            element.uploadState == UploadMediaAttachmentState.uploaded);

    isAllAttachedMediaUploadedSubject.add(allUploaded);
  }
}
