enum PleromaApiReplyVisibilityFilter {
  following,
  self,
}

const _followingPleromaApiReplyVisibilityFilterJsonValue = 'following';
const _selfPleromaApiReplyVisibilityFilterJsonValue = 'self';

extension PleromaApiReplyVisibilityFilterExtension
    on PleromaApiReplyVisibilityFilter {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaApiReplyVisibilityFilter.following:
        result = _followingPleromaApiReplyVisibilityFilterJsonValue;
        break;
      case PleromaApiReplyVisibilityFilter.self:
        result = _selfPleromaApiReplyVisibilityFilterJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiReplyVisibilityFilterStringExtension on String {
  PleromaApiReplyVisibilityFilter toPleromaApiReplyVisibilityFilter() {
    PleromaApiReplyVisibilityFilter result;

    switch (this) {
      case _followingPleromaApiReplyVisibilityFilterJsonValue:
        result = PleromaApiReplyVisibilityFilter.following;
        break;
      case _selfPleromaApiReplyVisibilityFilterJsonValue:
        result = PleromaApiReplyVisibilityFilter.self;
        break;
      default:
        throw 'Invalid PleromaApiReplyVisibilityFilterStringExtension $this';
    }

    return result;
  }
}
