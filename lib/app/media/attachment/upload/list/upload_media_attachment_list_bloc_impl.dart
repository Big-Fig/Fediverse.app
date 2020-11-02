import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc_device_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/upload/uploaded_upload_media_attachment_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
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
    addDisposable(disposable: CustomDisposable(() async {
      await clear();
    }));
    addDisposable(disposable: CustomDisposable(() async {
      await uploadedSubscription?.dispose();
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
  Future attachMedia(IMediaDeviceFile mediaDeviceFile) async {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(mediaDeviceFile);

    if (existedBloc == null) {
      var uploadMediaAttachmentBloc = UploadMediaAttachmentBlocDevice(
        mediaDeviceFile: mediaDeviceFile,
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
          IMediaDeviceFile mediaDeviceFile) =>
      mediaAttachmentBlocs.firstWhere((bloc) {
        if (bloc is UploadMediaAttachmentBlocDevice) {
          return bloc.mediaDeviceFile == mediaDeviceFile;
        } else {
          return false;
        }
      }, orElse: () => null);

  static bool isMaximumAttachmentReached(
          {@required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
          @required int maximumMediaAttachmentCount}) =>
      mediaAttachmentBlocs.length >= maximumMediaAttachmentCount;

  @override
  Future clear() async {
    mediaAttachmentBlocs.clear();
    if (!mediaAttachmentBlocsSubject.isClosed) {
      mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
    }

    for (var mediaAttachmentBloc in mediaAttachmentBlocs) {
      await mediaAttachmentBloc.dispose();
    }
  }

  void _recalculateIsAllAttachedMediaUploaded() {
    var allUploaded = mediaAttachmentBlocs.fold(
        true,
        (previousValue, element) =>
            previousValue &&
            element.uploadState.type ==
                UploadMediaAttachmentStateType.uploaded);

    isAllAttachedMediaUploadedSubject.add(allUploaded);
  }

  @override
  void addUploadedAttachment(IPleromaMediaAttachment attachment) {
    mediaAttachmentBlocs.add(
      UploadedUploadMediaAttachmentBloc(
        pleromaMediaAttachment: attachment,
      ),
    );
    mediaAttachmentBlocsSubject.add(mediaAttachmentBlocs);
  }
}