import 'dart:io';


import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_exception.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_service.dart';
import 'package:fedi/mastodon/rest/mastodon_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';

class MastodonMediaAttachmentService
    implements IMastodonMediaAttachmentService {
  final IMastodonRestService restService;

  MastodonMediaAttachmentService({@required this.restService});

  @override
  Future<MastodonMediaAttachment> uploadMedia({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.post(
            relativePath: "/api/v1/media", files: {"file": file}));

    if (httpResponse.statusCode == 200) {
      return MastodonMediaAttachment.fromJsonString(httpResponse.body);
    } else {
      throw MastodonMediaAttachmentUploadException(
          file: file,
          statusCode: httpResponse.statusCode,
          body: httpResponse.body);
    }
  }
}
