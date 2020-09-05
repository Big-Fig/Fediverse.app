import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_uploaded_bloc_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class UploadMediaAttachmentsCollectionBloc extends DisposableOwner
    implements IUploadMediaAttachmentsCollectionBloc {
  @override
  final int maximumMediaAttachmentCount;
  @override
  final int maximumFileSizeInBytes;

  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;

  DisposableOwner uploadedSubscription;

  UploadMediaAttachmentsCollectionBloc({
    @required this.maximumMediaAttachmentCount,
    @required this.pleromaMediaAttachmentService,
    @required this.maximumFileSizeInBytes,
  }) {
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
      BehaviorSubject.seeded(true);

  @override
  bool get isAllAttachedMediaUploaded =>
      isAllAttachedMediaUploadedSubject.value;

  @override
  Stream<bool> get isAllAttachedMediaUploadedStream =>
      isAllAttachedMediaUploadedSubject.stream;

  @override
  List<IUploadMediaAttachmentBloc> get onlyMediaAttachmentBlocs =>
      mediaAttachmentBlocs?.where((bloc) => bloc.isMedia)?.toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get onlyMediaAttachmentBlocsStream =>
      mediaAttachmentBlocsSubject.stream.map((mediaAttachmentBlocs) =>
          mediaAttachmentBlocs?.where((bloc) => bloc.isMedia)?.toList());

  @override
  List<IUploadMediaAttachmentBloc> get onlyNonMediaAttachmentBlocs =>
      mediaAttachmentBlocs?.where((bloc) => !bloc.isMedia)?.toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>>
      get onlyNonMediaAttachmentBlocsStream =>
          mediaAttachmentBlocsSubject.stream.map((mediaAttachmentBlocs) =>
              mediaAttachmentBlocs?.where((bloc) => !bloc.isMedia)?.toList());

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
  Future attachMedia(FilePickerFile filePickerFile) async {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(filePickerFile);

    if (existedBloc == null) {
      var uploadMediaAttachmentBloc = UploadMediaAttachmentBloc(
        filePickerFile: filePickerFile,
        pleromaMediaAttachmentService: pleromaMediaAttachmentService,
        maximumFileSizeInBytes: maximumFileSizeInBytes,
      );
      mediaAttachmentBlocs.add(uploadMediaAttachmentBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
      await uploadMediaAttachmentBloc.startUpload();
    }
  }

  @override
  void detachMediaAttachmentBloc(
      IUploadMediaAttachmentBloc mediaAttachmentBloc) {
    if (mediaAttachmentBloc != null) {
      mediaAttachmentBloc.dispose();
      mediaAttachmentBlocs.remove(mediaAttachmentBloc);
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }
  }

  IUploadMediaAttachmentBloc findMediaAttachmentBlocByFilePickerFile(
          FilePickerFile filePickerFile) =>
      mediaAttachmentBlocs.firstWhere((bloc) {
        if (bloc is UploadMediaAttachmentBloc) {
          return bloc.filePickerFile == filePickerFile;
        } else {
          return false;
        }
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
            element.uploadState.type == UploadMediaAttachmentStateType.uploaded);

    isAllAttachedMediaUploadedSubject.add(allUploaded);
  }

  @override
  void addUploadedAttachment(IPleromaMediaAttachment attachment) {
    mediaAttachmentBlocs.add(
      UploadMediaAttachmentUploadedBloc(
        pleromaMediaAttachment: attachment,
      ),
    );
    mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
  }
}
