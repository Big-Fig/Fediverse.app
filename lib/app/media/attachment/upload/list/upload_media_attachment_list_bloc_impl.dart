import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc_device_impl.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/uploaded_upload_media_attachment_bloc_impl.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:rxdart/rxdart.dart';

class UploadMediaAttachmentsCollectionBloc extends DisposableOwner
    implements IUploadMediaAttachmentsCollectionBloc {
  @override
  final int maximumMediaAttachmentCount;
  @override
  final int? maximumFileSizeInBytes;

  final IPleromaApiMediaAttachmentService pleromaMediaAttachmentService;

  DisposableOwner? uploadedSubscriptionDisposable;

  UploadMediaAttachmentsCollectionBloc({
    required this.maximumMediaAttachmentCount,
    required this.pleromaMediaAttachmentService,
    required this.maximumFileSizeInBytes,
  }) {
    uploadMediaAttachmentBlocsSubject.disposeWith(this);
    isAllAttachedMediaUploadedSubject.disposeWith(this);

    addCustomDisposable(() => clear());
    addCustomDisposable(() => uploadedSubscriptionDisposable?.dispose());

    uploadMediaAttachmentBlocsStream.listen(
      (mediaAttachmentBlocs) {
        uploadedSubscriptionDisposable?.dispose();
        uploadedSubscriptionDisposable = DisposableOwner();
        mediaAttachmentBlocs.forEach(
          (bloc) {
            uploadedSubscriptionDisposable!.addDisposable(
              StreamSubscriptionDisposable(
                bloc.uploadStateStream.listen(
                  (_) {
                    _recalculateIsAllAttachedMediaUploaded();
                  },
                ),
              ),
            );
          },
        );
      },
    ).disposeWith(this);
  }

  // ignore: close_sinks
  BehaviorSubject<List<IUploadMediaAttachmentBloc>>
      uploadMediaAttachmentBlocsSubject = BehaviorSubject.seeded(
    [],
  );

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
      uploadMediaAttachmentBlocs
          .where(
            (bloc) => bloc.isMedia,
          )
          .toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>> get onlyMediaAttachmentBlocsStream =>
      uploadMediaAttachmentBlocsSubject.stream
          .map((mediaAttachmentBlocs) => mediaAttachmentBlocs
              .where(
                (bloc) => bloc.isMedia,
              )
              .toList());

  @override
  List<IUploadMediaAttachmentBloc> get onlyNonMediaAttachmentBlocs =>
      uploadMediaAttachmentBlocs
          .where(
            (bloc) => !bloc.isMedia,
          )
          .toList();

  @override
  Stream<List<IUploadMediaAttachmentBloc>>
      get onlyNonMediaAttachmentBlocsStream =>
          uploadMediaAttachmentBlocsSubject.stream.map(
            (mediaAttachmentBlocs) =>
                mediaAttachmentBlocs.where((bloc) => !bloc.isMedia).toList(),
          );

  @override
  bool get isMaximumMediaAttachmentCountReached =>
      calculateIsMaximumAttachmentReached(
        mediaAttachmentBlocs: uploadMediaAttachmentBlocs,
        maximumMediaAttachmentCount: maximumMediaAttachmentCount,
      );

  @override
  Stream<bool> get isMaximumMediaAttachmentCountReachedStream =>
      uploadMediaAttachmentBlocsStream.map(
        (mediaAttachmentBlocs) => calculateIsMaximumAttachmentReached(
          mediaAttachmentBlocs: mediaAttachmentBlocs,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
        ),
      );

  @override
  int? get maximumMediaAttachmentCountLeft =>
      calculateMaximumMediaAttachmentCountLeft(
        mediaAttachmentBlocs: uploadMediaAttachmentBlocs,
        maximumMediaAttachmentCount: maximumMediaAttachmentCount,
      );

  @override
  Stream<int?> get maximumMediaAttachmentCountLeftStream =>
      uploadMediaAttachmentBlocsStream.map(
        (mediaAttachmentBlocs) => calculateMaximumMediaAttachmentCountLeft(
          mediaAttachmentBlocs: mediaAttachmentBlocs,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
        ),
      );

  @override
  bool get isPossibleToAttachMedia => !isMaximumMediaAttachmentCountReached;

  @override
  Stream<bool> get isPossibleToAttachMediaStream =>
      isMaximumMediaAttachmentCountReachedStream.map(
        (value) => !value,
      );

  @override
  List<IUploadMediaAttachmentBloc> get uploadMediaAttachmentBlocs =>
      uploadMediaAttachmentBlocsSubject.value;

  @override
  Stream<List<IUploadMediaAttachmentBloc>>
      get uploadMediaAttachmentBlocsStream =>
          uploadMediaAttachmentBlocsSubject.stream;

  @override
  Future attachMedia(IMediaDeviceFile mediaDeviceFile) async {
    var existedBloc = findMediaAttachmentBlocByFilePickerFile(mediaDeviceFile);

    if (existedBloc == null) {
      var uploadMediaAttachmentBloc = UploadMediaAttachmentBlocDevice(
        mediaDeviceFile: mediaDeviceFile,
        pleromaMediaAttachmentService: pleromaMediaAttachmentService,
        maximumFileSizeInBytes: maximumFileSizeInBytes,
      );
      uploadMediaAttachmentBlocsSubject.add(
        [
          ...uploadMediaAttachmentBlocs,
          uploadMediaAttachmentBloc,
        ],
      );
      // await uploadMediaAttachmentBloc.startUpload();
    }
  }

  @override
  Future attachMedias(List<IMediaDeviceFile> mediaDeviceFiles) async {
    var futures = mediaDeviceFiles.map(
      (mediaDeviceFile) => attachMedia(mediaDeviceFile),
    );

    await Future.wait(futures);
  }

  @override
  void detachMediaAttachmentBloc(
    IUploadMediaAttachmentBloc mediaAttachmentBloc,
  ) {
    mediaAttachmentBloc.dispose();
    uploadMediaAttachmentBlocs.remove(mediaAttachmentBloc);
    uploadMediaAttachmentBlocsSubject.add(
      [
        ...uploadMediaAttachmentBlocs,
      ],
    );
  }

  IUploadMediaAttachmentBloc? findMediaAttachmentBlocByFilePickerFile(
    IMediaDeviceFile mediaDeviceFile,
  ) =>
      uploadMediaAttachmentBlocs.firstWhereOrNull(
        (bloc) {
          if (bloc is UploadMediaAttachmentBlocDevice) {
            return bloc.mediaDeviceFile == mediaDeviceFile;
          } else {
            return false;
          }
        },
      );

  static bool calculateIsMaximumAttachmentReached({
    required List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
    required int maximumMediaAttachmentCount,
  }) {
    var maximumMediaAttachmentCountLeft =
        calculateMaximumMediaAttachmentCountLeft(
      mediaAttachmentBlocs: mediaAttachmentBlocs,
      maximumMediaAttachmentCount: maximumMediaAttachmentCount,
    );

    if (maximumMediaAttachmentCountLeft == null) {
      return false;
    } else {
      return maximumMediaAttachmentCountLeft <= 0;
    }
  }

  static int? calculateMaximumMediaAttachmentCountLeft({
    required List<IUploadMediaAttachmentBloc>? mediaAttachmentBlocs,
    required int? maximumMediaAttachmentCount,
  }) {
    if (maximumMediaAttachmentCount == null) {
      return null;
    }

    return maximumMediaAttachmentCount - mediaAttachmentBlocs!.length;
  }

  @override
  Future clear() async {
    uploadMediaAttachmentBlocs.clear();
    if (!uploadMediaAttachmentBlocsSubject.isClosed) {
      uploadMediaAttachmentBlocsSubject.add([]);
    }

    for (var mediaAttachmentBloc in uploadMediaAttachmentBlocs) {
      await mediaAttachmentBloc.dispose();
    }
  }

  void _recalculateIsAllAttachedMediaUploaded() {
    var allUploaded = uploadMediaAttachmentBlocs.fold(
      true,
      (dynamic previousValue, element) =>
          previousValue &&
          element.uploadState.type == UploadMediaAttachmentStateType.uploaded,
    );

    isAllAttachedMediaUploadedSubject.add(allUploaded);
  }

  @override
  void addUploadedAttachment(IPleromaApiMediaAttachment attachment) {
    uploadMediaAttachmentBlocs.add(
      UploadedUploadMediaAttachmentBloc(
        pleromaMediaAttachment: attachment,
      ),
    );
    uploadMediaAttachmentBlocsSubject.add(uploadMediaAttachmentBlocs);
  }
}
