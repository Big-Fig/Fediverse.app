import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';

extension TimelineRemoteTypeFilterSupportExtension on TimelineType {
  bool isOnlyWithMediaFilterSupportedOnInstance(AuthInstance authInstance) {
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

  bool isExcludeRepliesFilterSupportedOnInstance(AuthInstance authInstance) {
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
      AuthInstance authInstance) {
    // actually we can filter on client-side but this will
    // require additional pagination handling
    return false;
  }

  bool isWebSocketsUpdatesFilterSupportedOnInstance(
      AuthInstance? authInstance) {
    // actually we can filter on client-side but this will
    // require additional pagination handling
    return true;
  }

  bool isOnlyRemoteFilterSupportedOnInstance(AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return true;

      case TimelineType.customList:
        return authInstance.isPleroma;

      case TimelineType.home:
        return authInstance.isPleroma;

      case TimelineType.hashtag:
        return authInstance.isPleroma;

      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyLocalFilterSupportedOnInstance(AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return true;
      case TimelineType.customList:
        return authInstance.isPleroma;
      case TimelineType.home:
        return true;
      case TimelineType.hashtag:
        return authInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isWithMutedFilterSupportedOnInstance(AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return authInstance.isPleroma;
      case TimelineType.home:
        return authInstance.isPleroma;
      case TimelineType.customList:
        return authInstance.isPleroma;
      case TimelineType.hashtag:
        return authInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isExcludeVisibilitiesFilterSupportedOnInstance(
      AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return authInstance.isPleroma;
      case TimelineType.home:
        return authInstance.isPleroma;
      case TimelineType.customList:
        return authInstance.isPleroma;
      case TimelineType.hashtag:
        return authInstance.isPleroma;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyInListWithRemoteIdFilterSupportedOnInstance(
      AuthInstance? authInstance) {
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
      AuthInstance authInstance) {
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

  bool isWithHashtagFilterSupportedOnInstance(AuthInstance authInstance) {
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

  bool isOnlyFromInstanceFilterSupportedOnInstance(AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return authInstance.isPleroma;
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

  bool isReplyVisibilityFilterSupportedOnInstance(AuthInstance authInstance) {
    switch (this) {
      case TimelineType.public:
        return authInstance.isPleroma;
      case TimelineType.home:
        return authInstance.isPleroma;
      case TimelineType.customList:
        return false;
      case TimelineType.hashtag:
        return false;
      case TimelineType.account:
        return false;
    }
  }

  bool isOnlyPinnedFilterSupportedOnInstance(AuthInstance? authInstance) {
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

  bool isExcludeReblogsSupportedOnInstance(AuthInstance authInstance) {
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
