import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension TimelineRemoteTypeFilterSupportExtension on TimelineType {
  bool isOnlyWithMediaFilterSupportedOnInstance(
    IUnifediApiInstance unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
  ) =>
      false;

  bool isWebSocketsUpdatesFilterSupportedOnInstance(
    IUnifediApiInstance? unifediApiInstance,
  ) =>
      true;

  bool isOnlyRemoteFilterSupportedOnInstance(
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return true;

      case TimelineType.customList:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;

      case TimelineType.home:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;

      case TimelineType.hashtag:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;

      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyLocalFilterSupportedOnInstance(
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return true;
      case TimelineType.customList:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.home:
        return true;
      case TimelineType.hashtag:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isWithMutedFilterSupportedOnInstance(
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.home:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.customList:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.hashtag:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isExcludeVisibilitiesFilterSupportedOnInstance(
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.home:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.customList:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.hashtag:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyInListWithRemoteIdFilterSupportedOnInstance(
    IUnifediApiInstance? unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
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
    IUnifediApiInstance unifediApiInstance,
  ) {
    switch (this) {
      case TimelineType.public:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.home:
        return unifediApiInstance.typeAsUnifediApi.isPleroma;
      case TimelineType.customList:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyPinnedFilterSupportedOnInstance(
    IUnifediApiInstance? unifediApiInstance,
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
    IUnifediApiInstance unifediApiInstance,
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
