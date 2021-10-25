import 'package:fediverse_api/fediverse_api.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../account/pleroma_api_account_model.dart';
import '../pleroma_api_model.dart';
import '../version/pleroma_api_version_model_impl.dart';
import 'limits/poll/pleroma_api_instance_poll_limits_model.dart';
import 'metadata/pleroma_api_instance_metadata_model.dart';
import 'stats/pleroma_api_instance_stats_model.dart';
import 'urls/pleroma_api_instance_urls_model.dart';

abstract class IPleromaApiInstance
    implements
        IMastodonApiInstance,
        IPleromaApiResponse,
        IFediverseApiInstance {
  static const maxAttachedMedia = IMastodonApiInstance.maxAttachedMedia;

  int? get maxTootChars;

  IPleromaApiInstancePollLimits? get pollLimits;

  int? get uploadLimit;

  int? get avatarUploadLimit;

  int? get backgroundUploadLimit;

  int? get bannerUploadLimit;

  int? get descriptionLimit;

  int? get chatLimit;

  IPleromaApiInstancePleromaPart? get pleroma;

  String? get vapidPublicKey;

  String? get backgroundImage;

  @override
  IPleromaApiAccount? get contactAccount;

  @override
  IPleromaApiInstanceUrls? get urls;

  @override
  IPleromaApiInstanceStats? get stats;
}

abstract class IPleromaApiInstancePleromaPart
    implements IPleromaApiResponsePart {
  IPleromaApiInstanceMetadata? get metadata;
}

extension IPleromaApiInstanceExtension on IPleromaApiInstance {
  PleromaApiVersion get versionAsPleromaApi =>
      PleromaApiVersion.fromApiVersionString(versionString);
}
