import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';

extension TimelineRemoteTypeFilterSupportExtension on TimelineType {
  bool isOnlyWithMediaFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return true;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return true;
      case TimelineType.account:
        return true;
    }
  }

  bool isExcludeRepliesFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return true;
    }
  }

  bool isExcludeNsfwSensitiveFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    // actually we can filter on client-side but this will
    // require additional pagination handling
    return false;
  }

  bool isWebSocketsUpdatesFilterSupportedOnInstance(
    IPleromaApiInstance? pleromaApiInstance,
  ) {
    // actually we can filter on client-side but this will
    // require additional pagination handling
    return true;
  }

  bool isOnlyRemoteFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return true;

      case TimelineType.customList:
        return pleromaApiInstance.isPleroma;

      case TimelineType.home:
        return pleromaApiInstance.isPleroma;

      case TimelineType.hashtag:
        return pleromaApiInstance.isPleroma;

      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyLocalFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return true;
      case TimelineType.customList:
        return pleromaApiInstance.isPleroma;
      case TimelineType.home:
        return true;
      case TimelineType.hashtag:
        return pleromaApiInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isWithMutedFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return pleromaApiInstance.isPleroma;
      case TimelineType.home:
        return pleromaApiInstance.isPleroma;
      case TimelineType.customList:
        return pleromaApiInstance.isPleroma;
      case TimelineType.hashtag:
        return pleromaApiInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isExcludeVisibilitiesFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return pleromaApiInstance.isPleroma;
      case TimelineType.home:
        return pleromaApiInstance.isPleroma;
      case TimelineType.customList:
        return pleromaApiInstance.isPleroma;
      case TimelineType.hashtag:
        return pleromaApiInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyInListWithRemoteIdFilterSupportedOnInstance(
    IPleromaApiInstance? pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return true;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyFromAccountWithRemoteIdFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return true;
    }
  }

  bool isWithHashtagFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return true;
      case TimelineType.account:
        return true;
    }
  }

  bool isOnlyFromInstanceFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return pleromaApiInstance.isPleroma;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return false;
    }
  }

  bool isReplyVisibilityFilterSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return pleromaApiInstance.isPleroma;
      case TimelineType.home:
        return pleromaApiInstance.isPleroma;
      case TimelineType.customList:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyPinnedFilterSupportedOnInstance(
    IPleromaApiInstance? pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return true;
    }
  }

  bool isExcludeReblogsSupportedOnInstance(
    IPleromaApiInstance pleromaApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return false;
      case TimelineType.customList:
        return false;
      case TimelineType.home:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return true;
    }
  }
}
