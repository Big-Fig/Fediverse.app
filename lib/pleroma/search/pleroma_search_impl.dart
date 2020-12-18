import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_exception.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';

class PleromaSearchService extends DisposableOwner
    implements IPleromaMediaAttachmentService {
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

  PleromaSearchService({@required this.restService});

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  @override
  Future<PleromaMediaAttachment> uploadMedia({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.post(
            relativePath: "/api/v1/media", files: {"file": file}));

    if (httpResponse.statusCode == 200) {
      return PleromaMediaAttachment.fromJsonString(httpResponse.body);
    } else {
      throw PleromaMediaAttachmentUploadException(
          file: file,
          statusCode: httpResponse.statusCode,
          body: httpResponse.body);
    }
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
